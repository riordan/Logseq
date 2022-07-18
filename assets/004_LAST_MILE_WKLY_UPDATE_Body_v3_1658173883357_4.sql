CREATE OR REPLACE PACKAGE BODY PNDEV.LAST_MILE_WKLY_UPDATE IS
--------------------------------------------------------------------------------
/* 
   05/04/2022  mjg  Add cols for credit/debits.  Sum for each acct for the week
   02/14/2022  mjg  Use proration, not ss_credit 
   11/15/2021  mjg  Initial version of package
*/
--------------------------------------------------------------------------------
mf_copies           NUMBER(9,0) :=0;
sat_copies          NUMBER(9,0) :=0;
sun_copies          NUMBER(9,0) :=0;
mf_charge           NUMBER      :=0;
sat_charge          NUMBER      :=0;
sun_charge          NUMBER      :=0;
day_total           NUMBER(9,0) :=0;
month_total         NUMBER(9,4) :=0;
week_total          NUMBER(9,0) :=0;
daily_total         NUMBER(9,0) :=0;
sunday_total        NUMBER(9,0) :=0;
--
amortize_mail       NUMBER :=0;
amortize_op         NUMBER :=0;
--
TYPE varchar21_table   IS TABLE OF VARCHAR2(1)          INDEX BY BINARY_INTEGER;
TYPE varchar22_table   IS TABLE OF VARCHAR2(2)          INDEX BY BINARY_INTEGER;
TYPE date_table        IS TABLE OF DATE                 INDEX BY BINARY_INTEGER;
--
p_count               NUMBER(5,0) :=0;
p_date                date_table;
p_subtype             varchar22_table;
p_status              varchar21_table;
p_late_start          varchar21_table;
insert_new_money_row  BOOLEAN := FALSE;
v_new_date            DATE    := NULL;
--------------------------------------------------------------------------------

PROCEDURE fill_proration_arrays
                  (a_account    IN circ.SUBSCRIPTION.account%TYPE,
                   a_first_date IN DATE,
                   a_last_date  IN DATE,
                   a_ascending  IN BOOLEAN,
                   a_open_ended IN BOOLEAN,
                   a_use_backop IN BOOLEAN  DEFAULT FALSE,
                   a_late_start IN VARCHAR2 DEFAULT 'N') IS
----------
y               BINARY_INTEGER :=0;
v_first_date    DATE;
v_last_date     DATE;
v_applied_date  DATE;
v_use_backop    VARCHAR2(1) := 'N';
v_late_start    VARCHAR2(1) := 'N';                                        --5960
----------
CURSOR c_late_start IS                                                     --5960
  SELECT 'Y' FROM dual
   WHERE EXISTS (SELECT account
                   FROM circ.SUBS_TRANS, circ.SUBS_COMPLAINT
                  WHERE (circ.SUBS_TRANS.trans_num = circ.SUBS_COMPLAINT.trans_num)
                    AND (delete_date IS NULL) AND (trans_type = 5) AND (account=a_account)
                    AND trans_date=v_first_date AND late_start='Y');
--
CURSOR c_activity IS
  SELECT DECODE(v_use_backop,'Y',NVL(back_op_date,trans_date),trans_date) trans_date,
         trans_type,sub_type, status, debit_trans_num, back_op_date, late_start  --5960
    FROM circ.vw_subs_activity_w_late_start                                      --5960
   WHERE (account=a_account) AND (late_start IN ('N',a_late_start))              --5960
     AND (DECODE(v_use_backop,'Y',NVL(back_op_date,trans_date),trans_date)
              BETWEEN v_first_date+1 AND v_last_date)
ORDER BY DECODE(v_use_backop,'Y',NVL(back_op_date,trans_date),trans_date), trans_type,
         DECODE(back_op_date,NULL,2,1) ASC;
activity_rcd  c_activity%ROWTYPE;
--
CURSOR c_back_op_applied IS
  SELECT applied_date FROM circ.SUBS_TRANS
   WHERE trans_num=activity_rcd.debit_trans_num;
---------
BEGIN
--
--    **Fill in proration arrays for first date
--
  IF (a_last_date >= a_first_date) THEN
    v_first_date := TRUNC(a_first_date);
    v_last_date  := TRUNC(a_last_date);
  ELSE
    v_first_date := TRUNC(a_last_date);
    v_last_date  := TRUNC(a_first_date);
  END IF;
--
  IF (a_use_backop) THEN v_use_backop := 'Y'; END IF;
--
  p_count         := 1;
  p_date(1)       := v_first_date;
  p_subtype(1)    := circ.UTIL.sub_type_char(a_account,v_first_date,NULL,NULL,NULL,v_use_backop);
  p_status(1)     := circ.UTIL.sub_status_ai(a_account,v_first_date);
  p_late_start(1) := 'N';                                                  --5960
--
  IF (a_late_start = 'Y') THEN                                             --5960
    OPEN  c_late_start;
    FETCH c_late_start INTO v_late_start;
    CLOSE c_late_start;
    IF (v_late_start = 'Y') THEN
      p_late_start(1) := 'Y';
      p_status(1)     := 'A';
    END IF;
  END IF;                                                                  --5960
--
--  p_subtype(1) := SUBSTR(UTIL.sub_type(a_account,v_first_date),1,2);     /* use sub_type_char */
--  p_status(1)  := SUBSTR(UTIL.sub_stat(a_account,v_first_date,1,3),1,1); /* use sub_status_ai   */
--
--    **Get activity  in proration arrays
--
  OPEN  c_activity;
--
  LOOP
    FETCH c_activity INTO activity_rcd;
    EXIT WHEN c_activity%NOTFOUND;
--
    IF (p_date(p_count) = TRUNC(activity_rcd.trans_date)) THEN
      IF (p_subtype(p_count) IS NULL) THEN
        p_subtype(p_count) := activity_rcd.sub_type;
      END IF;
--
      IF (p_status(p_count)<>activity_rcd.status AND activity_rcd.late_start='Y') THEN  --5960
        p_status(p_count)     := activity_rcd.status;                                   --5960
        p_late_start(p_count) := 'Y';                                                   --5960
      END IF;
--
    ELSE
      p_count               := p_count + 1;
      p_subtype(p_count)    := activity_rcd.sub_type;
      p_status(p_count)     := activity_rcd.status;
      p_date(p_count)       := TRUNC(activity_rcd.trans_date);
      p_late_start(p_count) := activity_rcd.late_start;                    --5960
--
/*    IF (a_use_backop AND activity_rcd.trans_type=12 AND activity_rcd.back_op_date IS NOT NULL
          AND activity_rcd.debit_trans_num IS NOT NULL) THEN
        v_applied_date := SYSDATE;
        OPEN  c_back_op_applied;
        FETCH c_back_op_applied INTO v_applied_date;
        CLOSE c_back_op_applied;
        IF (v_applied_date IS NULL) THEN
          p_date(p_count) := TRUNC(activity_rcd.back_op_date);
        END IF;
      END IF;*/
    END IF;
--
  END LOOP;
--
  CLOSE c_activity;
----------
--
--      **If new money, then insert into proration arrays
--
  IF (NOT insert_new_money_row) THEN GOTO fill_in_missing;  END IF;
  IF (v_new_date >= p_date(p_count)) THEN
    p_count         := p_count + 1;
    p_date(p_count) := v_new_date;
    GOTO fill_in_missing;
  END IF;
--
  FOR x IN 1..p_count-1
  LOOP
    IF (v_new_date BETWEEN p_date(x) AND p_date(x+1)-1) THEN
      FOR y IN REVERSE x+1..p_count
      LOOP
        p_date(y+1)       := p_date(y);
        p_subtype(y+1)    := p_subtype(y);
        p_status(y+1)     := p_status(y);
        p_late_start(y+1) := p_late_start(y);                              --5960
      END LOOP;
      p_count           := p_count + 1;
      p_date(x+1)       := v_new_date;
      p_subtype(x+1)    := NULL;
      p_status(x+1)     := NULL;
      p_late_start(x+1) := 'N';                                            --5960
    END IF;
  END LOOP;
----------
<<fill_in_missing>>
--
--    **Fill in missing status  in proration arrays
--
  p_count            := p_count + 1;
  IF (a_open_ended) THEN
    p_date(p_count)  := papertrak.pkdate.maxdate;
  ELSE
    IF (a_ascending) THEN
      p_date(p_count)  := v_last_date + 1;
    ELSE
      p_date(p_count)  := v_last_date + 1;
    END IF;
  END IF;
--
  p_subtype(p_count) := NULL;
  p_status(p_count)  := NULL;
--
  FOR i IN 2..p_count
  LOOP
    IF (p_subtype(i)    IS NULL) THEN p_subtype(i)    := p_subtype(i-1); END IF;
    IF (p_status(i)     IS NULL) THEN p_status(i)     := p_status(i-1); END IF;
    IF (NOT p_late_start.EXISTS(i)) THEN p_late_start(i) := 'N'; END IF;   --5960
  END LOOP;
END fill_proration_arrays;
--------------------------------------------------------------------------------

FUNCTION proration(a_account    IN circ.SUBSCRIPTION.account%TYPE,
                   a_first_date IN DATE,
                   a_last_date  IN DATE,
                   a_rt_force   IN circ.RATE_SUBS.rate_table%TYPE  DEFAULT NULL, 
                   a_rate_date  IN DATE                            DEFAULT NULL,
                   a_pap_code   IN circ.paper.code%TYPE            DEFAULT NULL)                          
                   RETURN NUMBER IS
----------
o_proration   NUMBER :=0;
v_proration   NUMBER :=0;
mf_copies_t   NUMBER(7,0) :=0;                                             --2360
sat_copies_t  NUMBER(7,0) :=0;                                             --2360
sun_copies_t  NUMBER(7,0) :=0;                                             --2360
mf_charge_t   NUMBER :=0;                                                  --2360
sat_charge_t  NUMBER :=0;                                                  --2360
sun_charge_t  NUMBER :=0;                                                  --2360
----------
BEGIN
--
--    **Fill in proration arrays
--
  fill_proration_arrays(a_account,a_first_date,a_last_date,TRUE,FALSE);
--
--    **Compute proration for each activity row where the account is
--    **active and not carrier collect
--
  mf_copies     := 0;
  sat_copies    := 0;
  sun_copies    := 0;
  mf_charge     := 0;
  sat_charge    := 0;
  sun_charge    := 0;
  o_proration   := 0;
  v_proration   := 0;
  amortize_mail := 0;
  amortize_op   := 0;
--
--raise_application_error(-20000,p_count);
  FOR i IN 1..p_count-1
  LOOP
    IF (p_status(i)='A' AND p_subtype(i)<>'CC') THEN
      v_proration  := circ.subs_compute.ss_credit(a_account,p_date(i),p_date(i+1),a_rt_force,a_rate_date,null,a_pap_code);
      o_proration  := o_proration + v_proration;
      mf_copies_t  := mf_copies_t  + circ.subs_compute.mf_copies;                           
      sat_copies_t := sat_copies_t + circ.subs_compute.sat_copies;                          
      sun_copies_t := sun_copies_t + circ.subs_compute.sun_copies;                           
      mf_charge_t  := mf_charge_t  + circ.subs_compute.mf_charge;                            
      sat_charge_t := sat_charge_t + circ.subs_compute.sat_charge;                           
      sun_charge_t := sun_charge_t + circ.subs_compute.sun_charge;                           
--
      IF (p_subtype(i) = 'OP') THEN
        amortize_op   := amortize_op   + v_proration;
      ELSE
        amortize_mail := amortize_mail + v_proration;
      END IF;
    END IF;
--dbms_output.put_line(a_pap_code||'  '||v_proration||'  '||to_char(p_date(i),'mm/dd/yy') ||' - '||to_char(p_date(i+1)-1,'mm/dd/yy')||
--                                 '  '||to_CHAR(mf_copies+sat_copies)||'  '||sun_copies);
  END LOOP;
--
  amortize_op   := ROUND(amortize_op,5);
  amortize_mail := ROUND(amortize_mail,5);
  mf_copies     := mf_copies_t;                                            --2360
  sat_copies    := sat_copies_t;                                           --2360
  sun_copies    := sun_copies_t;                                           --2360
  mf_charge     := mf_charge_t;                                            --2360
  sat_charge    := sat_charge_t;                                           --2360
  sun_charge    := sun_charge_t;                                           --2360
  RETURN (amortize_op+amortize_mail);
END proration;
--------------------------------------------------------------------------------

PROCEDURE  week_end (a_we_date        date) IS
----------
n_rec           number     :=0;
n_err           number     :=0;
n_row_id        number(12) :=0;
n_day_num       integer;
v_msg           varchar2(50) := null;
n_proration     number;
n_exists        number;
n_pub           circ.publication.publication%type;
v_route         circ.route.route%type;
n_car_acct      circ.carrier.account%type;
v_bill_category circ.billing_category.category%type;
v_rate_code     circ.carrier_rate_description.code%type;
d_start         date;
d_end           date;
n_acct          circ.subscription.account%type;
b_has_crdr      boolean;
----------
CURSOR c_get_accts is
  select /*+ ordered use_nl(sub bn hh adrs st pchg spap pap rt dtyp) */
         sub.account, subscriber browse_id, bn.household_id, hh.address address_id,
         replace(search_name,',',' ') name_search, 
         hh.address, zip, nvl(pchg.rate_table,sub.rate_table) rate_table,
         quantity, spap.paper_code pap_code, spap.prod_code, pap.publication pub_paper,
         per_copy dly_copy_rate, per_copy_sun sun_copy_rate, sub.publication route_pub,
         dtyp.bill_category, st.valid_from, st.valid_until, 
         LAST_ACTIVITY, STATUS_ON_LAST_ACTIVITY
    from circ.subscription sub, addr.browse_name bn, addr.household hh, addr.address adrs,
         circ.subs_trans st, circ.subs_papchg pchg, circ.subs_papers spap, circ.paper pap,
         circ.rate_subs rt, circ.draw_type dtyp
   where not (last_activity<a_we_date-6 and status_on_last_activity=0)
     and sub.subscriber=bn.rec_id
     and bn.household_id=hh.household
     and adrs.id=hh.address
     and st.account=sub.account and delete_date is null and trans_type=4
     and st.trans_num=pchg.trans_num
     and spap.trans_num=pchg.trans_num
     and pap.code=spap.paper_code
     and pap.draw_type=dtyp.code
     and nvl(pchg.rate_table,sub.rate_table)=rt.rate_table 
     and ((a_we_date   between st.valid_from and st.valid_until) OR
          (a_we_date-6 between st.valid_from and st.valid_until))
     and rt.paper_code=spap.paper_code and rt.prod_code=spap.prod_code
     and a_we_date between rt.valid_from and rt.valid_until
--     and rownum<5000
--     and sub.account in (135627454)
     ;
--
CURSOR c_route_info IS
  select route_name, rte.ADI, rte.district, district_desc, sub_district, zone_code
    from 
  
  (select rte.publication, rte.route, NAME route_name, rte.ADI, rte.district,  
          description district_desc, DEPOT sub_district
     from circ.route rte, circ.district ds
   where rte.publication=ds.publication and rte.district=ds.district) rte,
   
  (select publication, route, zone_code
     from circ.jt_route_zonebase jt
    where valid_sun='Y') jt
     
  where rte.publication=jt.publication(+) and rte.route=JT.route(+)
    and rte.publication=n_pub and rte.route=v_route;
--
CURSOR c_get_carrier IS
  select account car_account, rate_code
    from circ.carrier_route
   where publication=n_pub and route=v_route
     and a_we_date between valid_from and valid_until;
--
CURSOR c_car_info IS
  select browse_name, bn.household_id, hh.address, 
         replace(search_name,',',' ') car_name, publication
    from circ.carrier car, addr.browse_name bn, addr.household hh
   where car.browse_name=bn.rec_id and bn.household_id=hh.household
     and account=n_car_acct;
--
CURSOR c_rate_method IS
  select rate_method, rate_monday car_rate_dly, rate_sunday car_rate_sun
    from circ_rpt.vw_carrier_rate_drw
   where rate_code=v_rate_code 
     and a_we_date between valid_from and valid_until
     and applied_to='DR' 
     and billing_category=v_bill_category;
--
CURSOR c_car_misc_drcr IS
  select sum(amount) amt, code
    from circ.carrier_trans
   where account=n_car_acct 
     and code in ('FCCADJ','FCFADD','FCLES','FCINC','SVC','FBONUS','TIPS')
     and delete_date is null
     and trans_date between a_we_date-6 and a_we_date
 group by code;
--
CURSOR c_sub_complaints IS
  select complaint code, -round(sum(amount),2) amount
    from circ.subs_trans st, circ.subs_complaint sc
   where st.trans_num=sc.trans_num
     and trans_type=5 and delete_date is null
     and trans_date between a_we_date-6 and a_we_date
     and account=n_acct
     and complaint in ('AC','DD','DF','ND','PD','PV')
     and not exists (select 1 
                       from pndev.last_mile_hd
                      where account=n_acct and we_date=a_we_date)
            
 group by complaint;
-- 
CURSOR c_sub_crdr IS
  select /*+ use_nl(st sc crdr) index(crdr) */
         sc.code, code_type, round(sum(amount),2) amount
    from circ.subs_trans st, circ.subs_credit_debit sc, circ.credit_debit crdr 
   where st.trans_num=sc.trans_num and sc.code=crdr.code
     and trans_type=6 and delete_date is null
     and trans_date between a_we_date-6 and a_we_date
     and account=n_acct
     and sc.code in ('ORDA','ORDN','ORDO','ORDR','ORDT','ORDX','SERD',
                     'SERI','SERL','SERM','SERN','SERR','SERV','SERX')
     and not exists (select 1 
                       from pndev.last_mile_hd
                      where account=n_acct and we_date=a_we_date)
 group by sc.code, code_type;
----------
xr pndev.last_mile_hd%ROWTYPE;
----------
BEGIN 
--
--      **Start job log 
--
  n_day_num := papertrak.pkdate.daynum_dsi(a_we_date);
  if (n_day_num<>7) then v_msg:='Date is NOT a Sunday -- Job Aborted'; end if;
  security.pk_job.job_start('CIRC','Last Mile Weekly Update for '||to_char(a_we_date,'mm/dd/yyyy'),v_msg);
  if (v_msg is not null) then goto finished; end if;
--
--      **Delete Existing Rows for W/E Date
--
  select count(*) into n_rec from pndev.last_mile_hd where we_date = a_we_date;
  if (n_rec > 0) then
    security.pk_job.insert_detail(null,'Deleting '||to_char(n_rec)||' Rows for '||to_char(a_we_date,'mm/dd/yyyy'));
    delete from pndev.last_mile_hd where we_date = a_we_date;
    security.pk_job.insert_detail(null,'Delete Complete');
    commit;
  end if;
--
--       **Process Each Candidate Row
--
  n_rec := 0;
--
  FOR x in c_get_accts
  LOOP
    n_acct     := x.account;
    b_has_crdr := false;
    xr         := null;
--
--       **Get complaint amounts for account
--
    FOR z IN  c_sub_complaints
    LOOP
      b_has_crdr := true;
      IF (z.code='AC') THEN xr.ac_cr := z.amount; END IF;
      IF (z.code='DD') THEN xr.dd_cr := z.amount; END IF;
      IF (z.code='DF') THEN xr.df_cr := z.amount; END IF;
      IF (z.code='ND') THEN xr.nd_cr := z.amount; END IF;
      IF (z.code='PD') THEN xr.pd_cr := z.amount; END IF;
      IF (z.code='PV') THEN xr.pv_cr := z.amount; END IF;
    END LOOP;
--
--       **Get cr/dr amounts for account
--  
    FOR z IN  c_sub_crdr
    LOOP
      b_has_crdr := true;
      If (z.code_type='C') THEN z.amount := -z.amount; END IF;
--
      IF (z.code='ORDA') THEN xr.orda_cr := z.amount; END IF;
      IF (z.code='ORDN') THEN xr.ordn_cr := z.amount; END IF;
      IF (z.code='ORDO') THEN xr.ordo_cr := z.amount; END IF;
      IF (z.code='ORDR') THEN xr.ordr_dr := z.amount; END IF;
      IF (z.code='ORDT') THEN xr.ordt_cr := z.amount; END IF;
      IF (z.code='ORDX') THEN xr.ordx_cr := z.amount; END IF;
      IF (z.code='SERD') THEN xr.serd_cr := z.amount; END IF;
      IF (z.code='SERI') THEN xr.seri_cr := z.amount; END IF;
      IF (z.code='SERL') THEN xr.serl_cr := z.amount; END IF;
      IF (z.code='SERM') THEN xr.serm_cr := z.amount; END IF;
      IF (z.code='SERN') THEN xr.sern_dr := z.amount; END IF;
      IF (z.code='SERR') THEN xr.serr_dr := z.amount; END IF;
      IF (z.code='SERV') THEN xr.serv_cr := z.amount; END IF;
      IF (z.code='SERX') THEN xr.serx_cr := z.amount; END IF;
    END LOOP; 
--
--       ** Check whether acct inactive for entire week
--
    FOR z in 1..7
    LOOP
      IF (CIRC.UTIL.SUB_STATUS_AI(x.acCount, a_we_date-7+z, x.LAST_ACTIVITY, x.STATUS_ON_LAST_ACTIVITY) = 'A')THEN
        goto get_copies;
      END IF;
    END LOOP;
    IF (not b_has_crdr) THEN goto bypass_insert; END IF; --Inactive the entire week and no cr/dr
--
--       **Get copies and Revenue for week
--
  <<get_copies>>
    d_start := a_we_date-6;
    d_end   := a_we_date;
    IF (x.valid_from > d_start) THEN d_start := x.valid_from;  END IF;
    IF (x.valid_until < d_end)  THEN d_end   := x.valid_until; END IF;
    n_proration    := proration(x.account, d_start, d_end, null, null, x.pap_code);
--
    xr.dly_copies  := mf_copies + sat_copies; 
    xr.sun_copies  := sun_copies;
    xr.dly_sub_rev := mf_charge + sat_charge; 
    xr.sun_sub_rev := sun_charge;
--dbms_output.put_line(x.pap_code||'  '||n_proration||'  '||to_char(d_start,'mm/dd/yy') ||' - '||to_char(d_end,'mm/dd/yy')||
--                     '  '||xr.dly_copies||'  '||xr.sun_copies);
--
    IF ((xr.dly_copies + xr.sun_copies) = 0 and not b_has_crdr) THEN goto bypass_insert; END IF;
--    
--       **Get route and route info
--
    n_pub    := x.route_pub;
    v_route  := CIRC.UTIL.F_ROUTE_FOR_ACCOUNT(x.account,a_we_date);
    xr.route := v_route;
    OPEN  c_route_info;
    FETCH c_route_info INTO xr.route_name, xr.adi, xr.district, xr.district_desc,
                            xr.sub_district, xr.zone_code;
    CLOSE c_route_info;
--       
--       **Get carrier info, rates and compute amts
--
    IF (x.pub_paper not in (3,4,50,150)) THEN
      OPEN  c_get_carrier;
      FETCH c_get_carrier INTO xr.car_account, xr.rate_code;
      CLOSE c_get_carrier;
--
      n_car_acct := xr.car_account;
      OPEN  c_car_info;
      FETCH c_car_info INTO xr.car_browse_id, xr.car_household_id, xr.car_address_id,
                            xr.car_name, xr.car_pub;
      CLOSE c_car_info;
--
      v_bill_category := x.bill_category;
      v_rate_code     := xr.rate_code;
      OPEN  c_rate_method;
      FETCH c_rate_method INTO xr.rate_method, xr.car_rate_dly, xr.car_rate_sun;
      CLOSE c_rate_method;
--
      xr.car_amt_dly := xr.dly_copies * xr.car_rate_dly;
      xr.car_amt_sun := xr.sun_copies * xr.car_rate_sun;
--
      FOR z IN c_car_misc_drcr 
      LOOP
        if (z.code = 'FCCADJ') THEN xr.field_comp_adjs    := z.amt; END IF;
        if (z.code = 'FCFADD') THEN xr.field_car_fee_adjs := z.amt; END IF;
        if (z.code = 'FCLES')  THEN xr.field_car_take_fee := z.amt; END IF;
        if (z.code = 'FCINC')  THEN xr.qual_incentive     := z.amt; END IF;
        if (z.code = 'SVC')    THEN xr.retention_bonus    := z.amt; END IF;
        if (z.code = 'FBONUS') THEN xr.finders_fee_bonus  := z.amt; END IF;
        if (z.code = 'TIPS')   THEN xr.sub_tips_on_bill   := z.amt; END IF;
      END LOOP;
    END IF;
--
--       **Insert row into table
--
    SELECT count(*) INTO n_exists from pndev.last_mile_hd 
     where we_date = a_we_date and account=x.account and pap_code=x.pap_code --and prod_code=x.prod_code
       and dly_copy_rate=x.dly_copy_rate and sun_copy_rate=x.sun_copy_rate
       and dly_copies=xr.dly_copies and sun_copies=xr.sun_copies;
    IF (n_exists > 0) then goto bypass_insert; end if;
--
    n_rec := n_rec+1;
    SELECT pndev.seq_last_mile_hd.NEXTVAL INTO xr.row_id FROM dual;
    INSERT INTO pndev.last_mile_hd
      (row_id,we_date,account,browse_id,household_id,address_id,name_search,zip,
       QUANTITY,PAP_CODE,PROD_CODE,RATE_TABLE,DLY_COPIES,DLY_COPY_RATE,
       SUN_COPIES,SUN_COPY_RATE,DLY_SUB_REV,SUN_SUB_REV,PUB_PAPER,
       CAR_ACCOUNT,CAR_BROWSE_ID,CAR_HOUSEHOLD_ID,CAR_ADDRESS_ID,CAR_NAME,
       CAR_PUB,ROUTE_PUB,ROUTE,ROUTE_NAME,ADI,DISTRICT,DISTRICT_DESC,
       SUB_DISTRICT,ZONE_CODE,RATE_CODE,RATE_METHOD,CAR_RATE_DLY,CAR_RATE_SUN,
       CAR_AMT_DLY,CAR_AMT_SUN,FIELD_COMP_ADJS,FIELD_CAR_FEE_ADJS,
       FIELD_CAR_TAKE_FEE,QUAL_INCENTIVE,RETENTION_BONUS,FINDERS_FEE_BONUS,SUB_TIPS_ON_BILL,
       AC_CR,DD_CR,DF_CR,ND_CR,ORDA_CR,ORDN_CR,ORDO_CR,ORDR_DR,ORDT_CR,
       ORDX_CR,PD_CR,PV_CR,SERD_CR,SERI_CR,SERL_CR,SERM_CR,SERN_DR,SERR_DR,
       SERV_CR,SERX_CR)
     VALUES
      (xr.row_id,a_we_date,x.account,x.browse_id,x.household_id,x.address_id,x.name_search,x.zip,
       x.QUANTITY,x.PAP_CODE,x.PROD_CODE,x.RATE_TABLE,xr.DLY_COPIES,x.DLY_COPY_RATE,
       xr.SUN_COPIES,x.SUN_COPY_RATE,xr.DLY_SUB_REV,xr.SUN_SUB_REV,x.PUB_PAPER,
       xr.CAR_ACCOUNT,xr.CAR_BROWSE_ID,xr.CAR_HOUSEHOLD_ID,xr.CAR_ADDRESS_ID,xr.CAR_NAME,
       xr.CAR_PUB,x.ROUTE_PUB,xr.ROUTE,xr.ROUTE_NAME,xr.ADI,xr.DISTRICT,xr.DISTRICT_DESC,
       xr.SUB_DISTRICT,xr.ZONE_CODE,xr.RATE_CODE,xr.RATE_METHOD,xr.CAR_RATE_DLY,xr.CAR_RATE_SUN,
       xr.CAR_AMT_DLY,xr.CAR_AMT_SUN,xr.FIELD_COMP_ADJS,xr.FIELD_CAR_FEE_ADJS,
       xr.FIELD_CAR_TAKE_FEE,xr.QUAL_INCENTIVE,xr.RETENTION_BONUS,xr.FINDERS_FEE_BONUS,xr.SUB_TIPS_ON_BILL,
       xr.AC_CR,xr.DD_CR,xr.DF_CR,xr.ND_CR,xr.ORDA_CR,xr.ORDN_CR,xr.ORDO_CR,xr.ORDR_DR,xr.ORDT_CR,
       xr.ORDX_CR,xr.PD_CR,xr.PV_CR,xr.SERD_CR,xr.SERI_CR,xr.SERL_CR,xr.SERM_CR,xr.SERN_DR,xr.SERR_DR,
       xr.SERV_CR,xr.SERX_CR);
--
       IF (mod(n_rec,10000)=0) THEN commit; END IF;
--
    <<bypass_insert>>
       null;
  END LOOP;
  security.pk_job.insert_detail(null,to_char(n_rec)||' Rows Processed');
------
<<finished>>
  security.pk_job.job_stop (null);
  commit;
END week_end;
--------------------------------------------------------------------------------
END;
/
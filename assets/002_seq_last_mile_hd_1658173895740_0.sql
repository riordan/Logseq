CREATE SEQUENCE pnprod.seq_last_mile_hd
  MAXVALUE 999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 50
  NOORDER;

GRANT SELECT ON pnprod.seq_last_mile_hd TO CIRC_FULL;
GRANT SELECT ON pnprod.seq_last_mile_hd TO CIRC_PORT WITH GRANT OPTION;
GRANT ALTER, SELECT ON pnprod.seq_last_mile_hd TO SALESFORCE;
GRANT ALTER, SELECT ON pnprod.seq_last_mile_hd TO SECURE_FULL;
GRANT ALTER, SELECT ON pnprod.seq_last_mile_hd TO SF_ROLE;

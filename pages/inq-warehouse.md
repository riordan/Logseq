- Bloat
	- We need to improve the data discovery experience in the inq-warehouse BigQuery project, as the current organization structure detracts from the intention of `inq-warehouse` being the gold standard for data work at The Inquirer.
	- At the time of writing ( [[2022/04/12]] ), there are 160 discrete tables in the `inq-warehouse.analytics` dataset, comprising all tables in (or previously in) our production DBT instance (see ((625584a2-d43f-4dc8-9ce7-1529ef9dc52f)) ). This single
		- inq-warehouse.analytics dataset:
		  id:: 625584a2-d43f-4dc8-9ce7-1529ef9dc52f
			- tableId                      Type    Labels   Time Partitioning   Clustered Fields
			   ----------------------------------------------- ------- -------- ------------------- ------------------
			    2022_goals                                      TABLE
			    agg__article_completions_per_day                TABLE
			    agg__conversions_per_day                        VIEW
			    agg__dma_hits_per_day                           VIEW
			    agg__engaged_time_per_day                       TABLE
			    agg__meter_conversions_per_day                  VIEW
			    agg__meter_stops_per_day                        VIEW
			    agg_audience_engagement_monthly                 VIEW
			    agg_e_edition_users_daily                       TABLE            DAY (field: date)
			    agg_e_edition_users_daily__dbt_tmp              TABLE            DAY (field: date)
			    agg_e_edition_users_monthly                     TABLE
			    agg_email_registrations_monthly                 VIEW
			    agg_mobile_app_subscribers_daily                VIEW
			    agg_mobile_app_users_daily                      TABLE            DAY (field: date)
			    agg_mobile_app_users_daily__dbt_tmp             TABLE            DAY (field: date)
			    agg_mobile_app_users_monthly                    TABLE
			    agg_subscriber_engagement_monthly               VIEW
			    agg_web_users_daily                             TABLE            DAY (field: date)
			    agg_web_users_daily__dbt_tmp                    TABLE            DAY (field: date)
			    agg_web_users_monthly                           TABLE
			    arc_to_hermes_final                             VIEW
			    article_authors                                 TABLE
			    article_performance                             TABLE            DAY (field: date)
			    article_performance__dbt_tmp                    TABLE            DAY (field: date)
			    article_performance_legacy                      VIEW
			    authors_daily                                   VIEW
			    beds_covid19_7day                               VIEW
			    beds_covid19_maybe_7day                         VIEW
			    beds_covid19_pediatric_7day                     VIEW
			    beds_occupied_total_7day                        VIEW
			    beds_total_7day                                 VIEW
			    cases_7dayavg                                   VIEW
			    cases_new                                       VIEW
			    cases_per_100k_7dayavg                          VIEW
			    cases_total                                     VIEW
			    census                                          VIEW
			    counties                                        TABLE
			    counties__nj_pa                                 TABLE
			    countries                                       TABLE
			    covid_beds                                      VIEW
			    covid_beds_counties                             TABLE
			    covid_beds_states                               TABLE
			    covid_cases                                     VIEW
			    covid_cases_counties                            TABLE
			    covid_cases_country                             TABLE
			    covid_cases_region                              VIEW
			    covid_cases_states                              TABLE
			    covid_counties                                  TABLE
			    covid_country                                   TABLE
			    covid_hosp                                      VIEW
			    covid_hosp_counties                             TABLE
			    covid_hosp_states                               TABLE
			    covid_inq_regions                               VIEW
			    covid_metrics_daily                             VIEW
			    covid_pivot                                     VIEW
			    covid_pivot_beds                                TABLE
			    covid_pivot_beds2                               TABLE
			    covid_pivot_cases                               TABLE
			    covid_pivot_deaths                              TABLE
			    covid_pivot_hospitalizations                    TABLE
			    covid_pivot_vaccinations                        TABLE
			    covid_state_regions                             VIEW
			    covid_states                                    TABLE
			    covid_vax                                       VIEW
			    covid_vax_country                               TABLE
			    covid_vax_states                                TABLE
			    dates                                           VIEW
			    deaths_7dayavg                                  VIEW
			    deaths_new                                      VIEW
			    deaths_per_100k_7dayavg                         VIEW
			    deaths_total                                    VIEW
			    dim_articles                                    TABLE
			    dim_contacts_daily                              TABLE
			    dim_subscriptions_daily                         TABLE
			    e_edition_engagement                            VIEW
			    e_edition_engagement_auth0_id                   TABLE            DAY (field: date)
			    engagement_detail                               TABLE            DAY (field: date)
			    engagement_detail__dbt_tmp                      TABLE            DAY (field: date)
			    facilities_hsas                                 TABLE
			    fct_email_addresses                             VIEW
			    fct_hits                                        TABLE            DAY (field: date)
			    fct_hits__dbt_tmp                               TABLE            DAY (field: date)
			    fct_hits_e_edition                              TABLE            DAY (field: date)
			    fct_hits_e_edition__dbt_tmp                     TABLE            DAY (field: date)
			    fct_pageviews                                   VIEW
			    fct_registered_users                            VIEW
			    fct_sessions                                    TABLE            DAY (field: date)
			    fct_sessions__dbt_tmp                           TABLE            DAY (field: date)
			    fct_sessions_mobile_app                         TABLE            DAY (field: date)
			    fct_sessions_mobile_app__dbt_tmp                TABLE            DAY (field: date)
			    ga_mobile_app_auth0_id                          TABLE            DAY (field: date)
			    ga_mobile_app_engagement                        VIEW
			    hosp_7dayavg                                    VIEW
			    hosp_new                                        VIEW
			    hosp_total                                      VIEW
			    hosp_unvaccinated_per_100k_7dayavg              VIEW
			    hosp_vaccinated_per_100k_7dayavg                VIEW
			    hospitalizations_by_covid_vaccination_status    TABLE
			    inquirer_web_engagement                         TABLE            DAY (field: date)
			    int_email_reg                                   VIEW
			    int_subs_engage                                 VIEW
			    int_total_audience                              VIEW
			    kpi_FY22_monthly_goals                          VIEW
			    kpi_monthly                                     VIEW
			    meter_dash_daily                                VIEW
			    meter_dash_fp                                   VIEW
			    meter_dash_weekly                               VIEW
			    monthly_kpi_final                               VIEW
			    period_start_dates                              VIEW
			    sf_contact_daily                                VIEW
			    sf_contacts                                     VIEW
			    sf_offer                                        VIEW
			    sf_subs_final                                   VIEW
			    sf_subscription                                 VIEW
			    sf_subscription_daily_counts                    VIEW
			    sf_subscription_pre_022822                      TABLE
			    sf_subscription_union                           VIEW
			    states                                          TABLE
			    stg_account                                     VIEW
			    stg_arc_content_metadata                        VIEW
			    stg_arc_to_hermes                               VIEW
			    stg_auth0                                       VIEW
			    stg_contact                                     VIEW
			    stg_covid__hospitalizations_facilities          VIEW
			    stg_covid__hospitalizations_pa_counties         VIEW
			    stg_covid__hospitalizations_pa_counties_dedup   VIEW
			    stg_covid__hospitalizations_us_states           VIEW
			    stg_covid__hospitalizations_us_states_dedup     VIEW
			    stg_covid__us                                   VIEW
			    stg_covid__us_counties                          VIEW
			    stg_covid__us_states                            VIEW
			    stg_covid__vaccinations_us_jurisdictions        VIEW
			    stg_editorial_analytics__arc_data               VIEW
			    stg_email_database                              VIEW
			    stg_ga360__hits                                 VIEW
			    stg_ga360__sessions                             VIEW
			    stg_ga_e_edition__hits                          VIEW
			    stg_ga_e_edition__sessions                      VIEW
			    stg_ga_mobile_app__hits                         VIEW
			    stg_ga_mobile_app__sessions                     VIEW
			    stg_hermes_typesetting                          VIEW
			    stg_liveintent__inventory_manager_report        VIEW
			    stg_nytcovid__us                                VIEW
			    stg_nytcovid__us_counties                       VIEW
			    stg_nytcovid__us_states                         VIEW
			    stg_nytcovid__uscounties                        VIEW
			    stg_offer                                       VIEW
			    stg_offer_product                               VIEW
			    stg_sf_contact_daily                            TABLE
			    stg_sf_subscription_daily                       TABLE
			    stg_subscription                                VIEW
			    stg_user360__hits                               VIEW
			    sub_engage_daily                                TABLE            DAY (field: date)
			    sub_engage_daily__dbt_tmp                       TABLE            DAY (field: date)
			    sub_engage_detail                               TABLE            DAY (field: date)
			    sub_engage_monthly                              VIEW
			    typesetting_data_final                          VIEW
			    vaccines_full_boosted_total                     VIEW
			    vaccines_full_total                             VIEW
			    vaccines_oneshot_total                          VIEW
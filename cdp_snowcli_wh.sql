EXECUTE IMMEDIATE $$
declare
    var_or_replace varchar;
    var_if_not_exists varchar default 'IF NOT EXISTS';
    var_wh_name varchar;
    var_wh_size varchar;
    var_max_clust_size INT default 1;
    var_min_clust_size INT default 1;
    var_scaling_policy varchar;
    var_autosuspend_secs INT default 60;
    var_warehouse_type varchar;
    var_global_primary_owner varchar;
    var_global_secondary_owner varchar;
    var_global_owner_group varchar;
    var_global_business_owner varchar;
    var_global_business_unit varchar;
    var_global_business_sub_unit varchar;
    var_global_buc varchar;
    var_wh_description varchar;
    var_global_deployment_id varchar;
    rv varchar;
begin
    var_or_replace :='';
    var_wh_name :='snowcli_wh';
    var_wh_size :='\'X-small\'';
    var_scaling_policy :='\'ECONOMY\'';
    var_warehouse_type :='\'STANDARD\'';
    var_global_primary_owner :='Ajay';
    var_global_secondary_owner :='Pawan';
    var_global_owner_group :='EDA';
    var_global_business_owner :='ÉDA';
    var_global_business_unit :='EDA';
    var_global_business_sub_unit :='EDA';
    var_global_buc :='EDA';
    var_wh_description :='Short description';
    var_global_deployment_id :='12345';

    EXECUTE IMMEDIATE FROM @myco_db.integrations.snowflake_cli/branches/main/cdp_create_warehouse_standard.sql;
    
end;
$$

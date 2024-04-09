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
    var_wh_name :='snowcli1_wh';
    var_wh_size :='\'X-small\'';
    var_scaling_policy :='\'ECONOMY\'';
    var_warehouse_type :='\'STANDARD\'';
    var_global_primary_owner :='Ajay1';
    var_global_secondary_owner :='Pawan1';
    var_global_owner_group :='EDA';
    var_global_business_owner :='ÉDA';
    var_global_business_unit :='EDA';
    var_global_business_sub_unit :='EDA';
    var_global_buc :='EDA';
    var_wh_description :='Short description';
    var_global_deployment_id :='12345';

    set OR_REPLACE = :var_or_replace;
    set IF_NOT_EXISTS = :var_if_not_exists;
    set WH_NAME = :var_wh_name;
    set WH_SIZE = :var_wh_size;
    set MAX_CLUST_SIZE = :var_max_clust_size;
    set MIN_CLUST_SIZE = :var_min_clust_size;
    set SCALING_POLICY = :var_scaling_policy;
    set AUTOSUSPEND_SECS = :var_autosuspend_secs;
    set WAREHOUSE_TYPE = :var_warehouse_type;
    set GLOBAL_PRIMARY_OWNER = :var_global_primary_owner;
    set GLOBAL_SECONDARY_OWNER = :var_global_secondary_owner;
    set GLOBAL_OWNER_GROUP = :var_global_owner_group;
    set GLOBAL_BUSINESS_OWNER = :var_global_business_owner;
    set GLOBAL_BUSINESS_UNIT = :var_global_business_unit;
    set GLOBAL_BUSINESS_SUB_UNIT = :var_global_business_sub_unit;
    set GLOBAL_BUC = :var_global_buc;
    set WH_DESCRIPTION = :var_wh_description;
    set GLOBAL_DEPLOYMENT_ID = :var_global_deployment_id;

    EXECUTE IMMEDIATE FROM @myco_db.integrations.snowflake_cli/branches/main/template/v1/cdp_create_warehouse_standard.sql;
    
end;
$$

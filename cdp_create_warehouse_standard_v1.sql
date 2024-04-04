EXECUTE IMMEDIATE $$
declare
    sql varchar;
    var_or_replace varchar;
    var_if_not_exists varchar;
    var_wh_name varchar;
    var_wh_size varchar;
    var_max_clust_size INT;
    var_min_clust_size INT;
    var_scaling_policy varchar;
    var_autosuspend_secs INT;
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
begin
    sql := 'CREATE ' || var_or_replace || 'WAREHOUSE ' || var_if_not_exists || ' ' || var_wh_name || ' WITH' || ' WAREHOUSE_SIZE=' || var_wh_size || ' MAX_CLUSTER_COUNT=' || var_max_clust_size  || ' MIN_CLUSTER_COUNT=' || var_min_clust_size || ' SCALING_POLICY=' || var_scaling_policy  || ' AUTO_SUSPEND=' || var_autosuspend_secs || ' WAREHOUSE_TYPE=' || var_warehouse_type || ' AUTO_RESUME= TRUE INITIALLY_SUSPENDED = TRUE' || ' COMMENT=\'{ ' || '"primary_owner" : "' || var_global_primary_owner || '", ' || '"secondary_owner" : "' || var_global_secondary_owner || '", ' || '"owner_group" : "' || var_global_owner_group || '", ' || '"business_owner" : "' || var_global_business_owner || '", ' || '"business_unit" : "' || var_global_business_unit || '", ' || '"business_sub_unit" : "' || var_global_business_sub_unit || '", ' || '"buc" : "' || var_global_buc || '", ' || '"description" : "' || var_wh_description || '", ' || '"deployment_id" : "' || var_global_deployment_id || '" ' || '}\';';
    execute immediate :sql;
end;
$$

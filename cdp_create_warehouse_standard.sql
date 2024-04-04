EXECUTE IMMEDIATE $$
declare
    sql varchar;
begin
    sql := 'CREATE ' || var_or_replace || 'WAREHOUSE ' || var_if_not_exists || ' ' || var_wh_name;
    sql := sql || ' WITH';
    sql := sql || ' WAREHOUSE_SIZE=' || var_wh_size;
    sql := sql || ' MAX_CLUSTER_COUNT=' || var_max_clust_size;
    sql := sql || ' MIN_CLUSTER_COUNT=' || var_min_clust_size;
    sql := sql || ' SCALING_POLICY=' || var_scaling_policy;
    sql := sql || ' AUTO_SUSPEND=' || var_autosuspend_secs;
    sql := sql || ' WAREHOUSE_TYPE=' || var_warehouse_type;
    sql := sql || ' AUTO_RESUME= TRUE INITIALLY_SUSPENDED = TRUE';
    sql := sql || ' COMMENT=\'{ ';
    sql := sql || '"primary_owner" : "' || var_global_primary_owner || '", ';
    sql := sql || '"secondary_owner" : "' || var_global_secondary_owner || '", ';
    sql := sql || '"owner_group" : "' || var_global_owner_group || '", ';
    sql := sql || '"business_owner" : "' || var_global_business_owner || '", ';
    sql := sql || '"business_unit" : "' || var_global_business_unit || '", ';
    sql := sql || '"business_sub_unit" : "' || var_global_business_sub_unit || '", ';
    sql := sql || '"buc" : "' || var_global_buc || '", ';
    sql := sql || '"description" : "' || var_wh_description || '", ';
    sql := sql || '"deployment_id" : "' || var_global_deployment_id || '" ' || '}\';';

    execute immediate :sql;
end;
$$
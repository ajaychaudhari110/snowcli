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
    SELECT GETVARIABLE('OR_REPLACE') INTO var_or_replace;
    SELECT GETVARIABLE('IF_NOT_EXISTS') INTO var_if_not_exists;
    SELECT GETVARIABLE('WH_NAME') INTO var_wh_name;
    SELECT GETVARIABLE('WH_SIZE') INTO var_wh_size;
    SELECT GETVARIABLE('MAX_CLUST_SIZE') INTO var_max_clust_size;
    SELECT GETVARIABLE('MIN_CLUST_SIZE') INTO var_min_clust_size;
    SELECT GETVARIABLE('set SCALING_POLICY') INTO var_scaling_policy;
    SELECT GETVARIABLE('AUTOSUSPEND_SECS') INTO var_autosuspend_secs;
    SELECT GETVARIABLE('WAREHOUSE_TYPE') INTO var_warehouse_type;
    SELECT GETVARIABLE('GLOBAL_PRIMARY_OWNER') INTO var_global_primary_owner;
    SELECT GETVARIABLE('GLOBAL_SECONDARY_OWNER') INTO var_global_secondary_owner;
    SELECT GETVARIABLE('GLOBAL_OWNER_GROUP') INTO var_global_owner_group;
    SELECT GETVARIABLE('GLOBAL_BUSINESS_OWNER') INTO var_global_business_owner;
    SELECT GETVARIABLE('GLOBAL_BUSINESS_UNIT') INTO var_global_business_unit;
    SELECT GETVARIABLE('GLOBAL_BUSINESS_SUB_UNIT') INTO var_global_business_sub_unit;
    SELECT GETVARIABLE('GLOBAL_BUC') INTO var_global_buc;
    SELECT GETVARIABLE('WH_DESCRIPTION') INTO var_wh_description;
    SELECT GETVARIABLE('GLOBAL_DEPLOYMENT_ID') INTO var_global_deployment_id;        
    
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

    execute immediate sql;
end;
$$

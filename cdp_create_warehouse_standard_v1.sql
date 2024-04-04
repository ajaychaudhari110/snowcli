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
    sql := 'CREATE ' || var_or_replace || 'WAREHOUSE ' || var_if_not_exists || ' ' || var_wh_name;
    select :sql;
end;
$$

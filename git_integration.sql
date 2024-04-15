use role accountadmin;
create database myco_db;
create schema myco_db.integrations;

create secret myco_db.integrations.git_secret
type = password
username = 'ajaychaudhari110'
password = '****************';

create api integration git_api_integration
api_provider = git_https_api
api_allowed_prefixes = ('https://github.com/ajaychaudhari110')
allowed_authentication_secrets = (myco_db.integrations.git_secret)
enabled = true;

show databases;
describe database myco_db;
describe schema myco_db.integrations;
show git repositories;
DESCRIBE GIT REPOSITORY myco_db.integrations.snowflake_cli;

create git repository myco_db.integrations.snowflake_cli
api_integration = git_api_integration
git_credentials = myco_db.integrations.git_secret
origin = 'https://github.com/ajaychaudhari110/snowcli.git';

alter git repository myco_db.integrations.snowflake_cli fetch;
show git branches in myco_db.integrations.snowflake_cli;

ls @myco_db.integrations.snowflake_cli/branches/main;

use warehouse compute_wh;
EXECUTE IMMEDIATE FROM @myco_db.integrations.snowflake_cli/branches/main/deployments/warehouses/US11111_CDP_SNOWCLI1_WH.sql;

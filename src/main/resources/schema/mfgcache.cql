use mfgcache;

/*****************************************
 Dataset Machine Logs Main Table
 Query: Select * From dataset_machine_logs
        Where  dataset_name = :DatasetName
        And    machine = :machine
        Limit  100
******************************************/
create table mfgcache.dataset_machine_logs (
dataset_name   text,
machine        text,
last_timestamp timestamp,
primary key ((dataset_name),machine));

/******************************************
 Flex License Mappings Main Table
 Query: Select * From flex_license_mappings
        Where  product_sku = :ProductSKU
        And    feature_name = :FeatureName
*******************************************/
create table mfgcache.flex_license_mappings (
product_sku     text,
feature_name    text,
updated_date    timestamp,
feature_type    text,
feature_version text,
mapping_count   bigint,
product_family  text,
expiry_days     bigint,
sku_id          bigint,
feature_id      bigint,
primary key ((product_sku),feature_name));

/******************************************
 Flex License Bindings Main Table
 Query: Select * From flex_license_bindings
        Where  serial_number = :SerialNo
*******************************************/
create table mfgcache.flex_license_bindings (
serial_number       text,
txn_id              text,
txn_type            text,
product_sku_feature text,
creation_date       timestamp,
txn_status          bigint,
sku_quantity        bigint,
license_count       bigint,
product_family      text,
license_key         text,
dla_type            text,
pak                 text,
dlr                 text,
order_number        bigint,
order_line_number   bigint,
feature_line_number bigint,
order_line_id       bigint,
feature_line_id     bigint,
product_description text,
generate_machine    text,
request_machine     text,
location            bigint,
user_name           text,
requesting_system   text,
primary key ((serial_number),txn_id,txn_type,product_sku_feature));

/*****************************
 ASA Rules Main Table
 Query: Select * From asarules
        Where  rulenew = :Rule
******************************/
create table mfgcache.asarules (
rulenew  text,
license  text,
upgrade  text,
platform text,
scenario text,
action   text,
ruletype text,
mkkey    text,
rectime  timestamp,
primary key ((rulenew),license,upgrade,platform,scenario,action));

/********************************
 MFG License Main Table
 Query: Select * From mfglicense
        Where  sernum = :SerialNo
*********************************/
create table mfgcache.mfglicense (
sernum            text,
tstrectime        timestamp,
rectime           timestamp,
machine           text,
srv               text,
uuttype           text,
type              text,
lic               text,
status            text,
lineid            int,
mkop              text,
key               text,
txn_id            text,
user_name         text,
requesting_system text,
primary key ((sernum),tstrectime));

/**********************************
 AAA AuthCodes Main Table
 Query: Select * From aaa_authcodes
        Where  authcode = :AuthCode
***********************************/
create table mfgcache.aaa_authcodes (
authcode          text,
expiry_timestamp  timestamp,
created_timestamp timestamp,
response_type     text,
credential_type   text,
requestor_id      text,
app_id            text,
redirect_url      text,
scope             text,
state             text,
server_name       text,
active            int,
update_timestamp  timestamp,
primary key (authcode))
with default_time_to_live = 2592000;

/*************************************
 AAA Tokens Main Table
 Query: Select * From aaa_tokens
        Where  aaa_token = :Token
        And    token_type = :TokenType
**************************************/
create table mfgcache.aaa_tokens (
aaa_token         text,
token_type        text,
expiry_timestamp  timestamp,
created_timestamp timestamp,
app_id            text,
refresh_token     text,
server_name       text,
authcode          text,
scopes            text,
primary key ((aaa_token),token_type))
with default_time_to_live = 2592000;

/****************************************
 AAA AuthCode Tokens Main Table
 Query: Select * From aaa_authcode_tokens
        Where  aaa_token = :Token
**************************************/
create table mfgcache.aaa_authcode_tokens (
authcode             text,
ac_expiry_timestamp  timestamp,
ac_created_timestamp timestamp,
ac_response_type     text,
ac_credential_type   text,
ac_requestor_id      text,
ac_app_id            text,
ac_redirect_url      text,
ac_scope             text,
ac_state             text,
ac_server_name       text,
aaa_token            text,
token_type           text,
tk_expiry_timestamp  timestamp,
tk_created_timestamp timestamp,
tk_app_id            text,
refresh_token        text,
tk_server_name       text,
rt_expiry_timestamp  timestamp,
primary key (authcode))
with default_time_to_live = 2592000;

/************************************
 AAA State Cache Main Table
 Query: Select * From aaa_state_cache
        Where  ac_state = :State
**************************************/
create table mfgcache.aaa_state_cache (
ac_state           timeuuid,
ac_app_id          text,
ac_response_type   text,
ac_server_name     text,
ac_credential_type text,
ac_redirect_url    text,
ac_requestor_id    text,
primary key (ac_state))
with default_time_to_live = 3600;

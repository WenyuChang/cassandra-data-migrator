use erp;

/*****************************************
 Dataset Attributes Main Table
 Query: Select * From dataset_attributes
        Where  dataset_name = :DatasetName
******************************************/
create table erp.dataset_attributes (
dataset_name   text,
attribute_name text,
data_source    text,
description    text,
primary key ((dataset_name),attribute_name));

/*****************************************
 Common Lookups Main Table
 Query: Select * From common_lookups
        Where  lookup_type = :LookupType
******************************************/
create table erp.common_lookups (
lookup_type      text,
lookup_code      text,
lookup_qualifier text,
description      text,
is_enabled       boolean,
primary key ((lookup_type),lookup_code));

/********************************
 MRCS Main Table
 Query: Select * From mrcs
        Where  product = :Product
*********************************/
create table erp.mrcs (
product          text,
id               int,
org              text,
prod_rev         text,
prod_ver         text,
prod_sch_date    timestamp,
prod_eco         text,
pn               text,
pn_rev           text,
pn_sch_date      timestamp,
pn_parent        text,
pn_eco           text,
pca              text,
clei             text,
eci              text,
upc              text,
eco_type         text,
business_unit    text,
product_family   text,
last_updated_by  text,
last_update_date timestamp,
primary key ((product),id));

/************************************************
 MRCS Query by time series data
 Query: Select * From tsd_mrcs
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_mrcs (
tsd_date         bigint,
tsd_timestamp    timestamp,
product          text,
id               int,
org              text,
prod_rev         text,
prod_ver         text,
prod_sch_date    timestamp,
prod_eco         text,
pn               text,
pn_rev           text,
pn_sch_date      timestamp,
pn_parent        text,
pn_eco           text,
pca              text,
clei             text,
eci              text,
upc              text,
eco_type         text,
business_unit    text,
product_family   text,
last_updated_by  text,
last_update_date timestamp,
primary key ((tsd_date),tsd_timestamp,product,id))
with default_time_to_live = 7776000;

/********************************
 BOMLite Main Table
 Query: Select * From bomlite
        Where  product = :Product
        And    pn = :PartNo
*********************************/
create table erp.bomlite (
product         text,
pn              text,
pn_parent       text,
prod_rev        text,
level           int,
synonym         int,
tan             int,
comp_qty        int,
serial_flag     text,
disable_date    timestamp,
update_date     timestamp,
synonyms        text,
qty             int,
belongtoglo     int,
bomlitesynonyms text,
primary key ((product),pn,pn_parent));

/************************************************
 BOMLite Query by time series data
 Query: Select * From tsd_bomlite
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_bomlite (
tsd_date        bigint,
tsd_timestamp   timestamp,
product         text,
pn              text,
pn_parent       text,
prod_rev        text,
level           int,
synonym         int,
tan             int,
comp_qty        int,
serial_flag     text,
disable_date    timestamp,
update_date     timestamp,
synonyms        text,
qty             int,
belongtoglo     int,
bomlitesynonyms text,
primary key ((tsd_date),tsd_timestamp,product,pn,pn_parent))
with default_time_to_live = 7776000;

/************************************
 RoHS SerPID Main Table
 Query: Select * From rohs_sn_ele_pid
        Where  pid = :Product
*************************************/
create table erp.rohs_sn_ele_pid (
pid              text,
sn_element_pid   text,
data_element_id  int,
quantity         int,
attribute1       text,
attribute2       text,
attribute3       text,
creation_date    timestamp,
last_update_date timestamp,
timestamp        timestamp,
primary key ((pid),sn_element_pid));

/************************************************
 RoHS SerPID by time series data
 Query: Select * From tsd_rohs_sn_ele_pid
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_rohs_sn_ele_pid (
tsd_date         bigint,
tsd_timestamp    timestamp,
pid              text,
sn_element_pid   text,
data_element_id  int,
quantity         int,
attribute1       text,
attribute2       text,
attribute3       text,
creation_date    timestamp,
last_update_date timestamp,
timestamp        timestamp,
primary key ((tsd_date),tsd_timestamp,pid,sn_element_pid))
with default_time_to_live = 7776000;

/****************************************
 RoHS Serial Number Ranges Main Table
 Query: Select * From rohs_serial_numbers
        Where  base_item_number = :ItemNo
*****************************************/
create table erp.rohs_serial_numbers (
base_item_number    text,
serial_id           int,
inventory_item_id   int,
start_serial_number text,
end_serial_number   text,
attribute_value     text,
resequence_count    int,
resequence_date     timestamp,
creation_date       timestamp,
timestamp           timestamp,
last_update_date    timestamp,
primary key ((base_item_number),serial_id));

/************************************************
 RoHS Serial Number by time series data
 Query: Select * From tsd_rohs_serial_numbers
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_rohs_serial_numbers (
tsd_date            bigint,
tsd_timestamp       timestamp,
base_item_number    text,
serial_id           int,
inventory_item_id   int,
start_serial_number text,
end_serial_number   text,
attribute_value     text,
resequence_count    int,
resequence_date     timestamp,
creation_date       timestamp,
timestamp           timestamp,
last_update_date    timestamp,
primary key ((tsd_date),tsd_timestamp,base_item_number,serial_id))
with default_time_to_live = 7776000;

/***********************************
 CMPD Main Table
 Query: Select * From cmpd
        Where  prodpartnum = :PartNo
************************************/
create table erp.cmpd (
prodpartnum    text,
prodpartrev    text,
grouprecnum    int,
prodname       text,
description    text,
function       text,
functionstatus int,
recordsharing  text,
runitfamily    text,
testprocess    text,
passwdfamily   text,
timestatus     text,
recordstatus   text,
username       text,
prodcodename   text,
machine        text,
testsite       text,
startdate      timestamp,
enddate        timestamp,
ecodevnum      text,
additionalinfo text,
optionstr1     text,
optionstr2     text,
optionnum3     int,
rectime        timestamp,
primary key ((prodpartnum),prodpartrev,grouprecnum));

/************************************************
 CMPD by time series data
 Query: Select * From tsd_cmpd
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cmpd (
tsd_date       bigint,
tsd_timestamp  timestamp,
prodpartnum    text,
prodpartrev    text,
grouprecnum    int,
prodname       text,
description    text,
function       text,
functionstatus int,
recordsharing  text,
runitfamily    text,
testprocess    text,
passwdfamily   text,
timestatus     text,
recordstatus   text,
username       text,
prodcodename   text,
machine        text,
testsite       text,
startdate      timestamp,
enddate        timestamp,
ecodevnum      text,
additionalinfo text,
optionstr1     text,
optionstr2     text,
optionnum3     int,
rectime        timestamp,
primary key ((tsd_date),tsd_timestamp,prodpartnum,prodpartrev,grouprecnum))
with default_time_to_live = 7776000;

/************************************
 CMPDIT Main Table
 Query: Select * From cmpdit
        Where  grouprecnum = :GroupNo
*************************************/
create table erp.cmpdit (
grouprecnum    int,
fieldnum       int,
type           text,
value          text,
totfieldnum    int,
optionstr1     text,
optionstr2     text,
optionnum3     int,
rectime        timestamp,
prodname       text,
description    text,
function       text,
functionstatus int,
primary key ((grouprecnum),fieldnum));

/************************************************
 CMPDIT by time series data
 Query: Select * From tsd_cmpdit
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cmpdit (
tsd_date       bigint,
tsd_timestamp  timestamp,
grouprecnum    int,
fieldnum       int,
type           text,
value          text,
totfieldnum    int,
optionstr1     text,
optionstr2     text,
optionnum3     int,
rectime        timestamp,
prodname       text,
description    text,
function       text,
functionstatus int,
primary key ((tsd_date),tsd_timestamp,grouprecnum,fieldnum))
with default_time_to_live = 7776000;

/******************************
 PIDVID Main Table
 Query: Select * From pidvid
        Where  pid = :ProductNo
*******************************/
create table erp.pidvid (
pid               text,
tan               text,
vid               text,
stat              int,
base_pid          text,
base_tan          text,
creation_date     timestamp,
created_by        int,
last_updated_by   int,
last_updated_date timestamp,
primary key ((pid),tan,vid));

/************************************************
 PIDVID by time series data
 Query: Select * From tsd_pidvid
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_pidvid (
tsd_date          bigint,
tsd_timestamp     timestamp,
pid               text,
tan               text,
vid               text,
stat              int,
base_pid          text,
base_tan          text,
creation_date     timestamp,
created_by        int,
last_updated_by   int,
last_updated_date timestamp,
primary key ((tsd_date),tsd_timestamp,pid,tan,vid))
with default_time_to_live = 7776000;

/***************************************
 PIDVID Query by basepid
 Query: Select * From pidvid_by_base_pid
        Where  base_pid = :BasePID
****************************************/
create table erp.pidvid_by_base_pid (
base_pid text,
pid      text,
tan      text,
vid      text,
stat     int,
base_tan text,
primary key ((base_pid),pid,tan,vid));

/***************************************
 PIDVID Query by basetan
 Query: Select * From pidvid_by_base_tan
        Where  base_tan = :BaseTAN
****************************************/
create table erp.pidvid_by_base_tan (
base_tan text,
pid      text,
tan      text,
vid      text,
stat     int,
base_pid text,
primary key ((base_tan),tan,pid,vid));

/*********************************
 Sales Order Main Table
 Query: Select * From sales_orders
        Where  line_id = :LineID
**********************************/
create table erp.sales_orders (
line_id                int,
ob_trans_id            int,
header_id              int,
ato_line_id            int,
link_to_line_id        int,
top_model_line_id      int,
ship_set_id            int,
ship_from_org_id       int,
sold_to_org_id         int,
order_number           int,
line_number            int,
option_number          int,
set_name               text,
item_number            text,
item_type_code         text,
ordered_quantity       int,
cancel_flag            text,
open_flag              text,
rohs_flag              text,
coo_compliance         text,
taa_flag               text,
dispatch_result_code   text,
production_result_code text,
cust_po_number         text,
bill_to_customer       text,
business_entity        text,
ship_to_customer       text,
ship_to_address        map <text,text>,
end_customer_name      text,
end_customer_address   map <text,text>,
booked_date            timestamp,
promise_date           timestamp,
cancel_line_date       timestamp,
fcd_date               timestamp,
fcd_recommit_date      timestamp,
dispatch_date          timestamp,
production_date        timestamp,
creation_date          timestamp,
last_updated_date      timestamp,
created_by             int,
last_updated_by        int,
primary key (line_id));

/******************************************************
 Sales Order by top model line ID
 Query: Select * From sales_orders_by_top_model_line_id
        Where  top_model_line_id = :TopLineID
*******************************************************/
create table erp.sales_orders_by_top_model_line_id (
top_model_line_id int,
line_id           int,
primary key ((top_model_line_id),line_id));

/**************************************
 System Items Main Table
 Query: Select * From system_items
        Where  item_number = :ItemNo
        And    organization_id = :OrgID
***************************************/
create table erp.system_items (
item_number                 text,
organization_id             int,
inventory_item_id           int,
enabled_flag                text,
description                 text,
attribute1                  text,
attribute2                  text,
customer_order_flag         text,
customer_order_enabled_flag text,
bom_enabled_flag            text,
build_in_wip_flag           text,
bom_item_type               int,
pick_components_flag        text,
replenish_to_order_flag     text,
wip_supply_type             int,
inventory_item_status_code  text,
planning_make_buy_code      int,
auto_created_config_flag    text,
item_type                   text,
groupnum                    int,
bflush                      text,
basename                    text,
timestamp                   timestamp,
last_update_date            timestamp,
creation_date               timestamp,
last_updated_by             int,
created_by                  int,
primary key ((item_number),organization_id));

/*********************************************
 System Items Query by groupnum
 Query: Select * From system_items_by_groupnum
        Where  groupnum = :GroupNo
**********************************************/
create table erp.system_items_by_groupnum (
groupnum          int,
item_number       text,
organization_id   int,
inventory_item_id int,
attribute1        text,
attribute2        text,
item_type         text,
bflush            text,
basename          text,
primary key ((groupnum), item_number, organization_id));

/*********************************************
 Master Template Main Table
 Query: Select * From master_template
        Where  attribute_name = :AttributeName
**********************************************/
create table erp.master_template (
attribute_name    text,
description       text,
qualifiers        set <text>,
validation_type   text,
validation_values text,
min_length        int,
max_length        int,
is_fpav_attribute boolean,
is_enabled        boolean,
is_hidden         boolean,
created_date      timestamp,
updated_date      timestamp,
primary key (attribute_name));

/*************************************
 Product Template Main Table
 Query: Select * From product_template
        Where  item_number = :ItemNo
        And    site_id = :SiteID
**************************************/
create table erp.product_template (
item_number       text,
site_id           int,
attribute_name    text,
required_count    int,
validation_type   text,
validation_values text,
min_length        int,
max_length        int,
default_value     text,
effective_date    timestamp,
disable_date      timestamp,
created_date      timestamp,
updated_date      timestamp,
primary key ((item_number),site_id,attribute_name));

/*********************************
 COO Rules Main Table
 Query: Select * From coo_rules
        Where  prodname = :Product
**********************************/
create table erp.coo_rules (
prodname text,
newrule  text,
rectime  timestamp,
primary key (prodname));

/*************************************
 COO Rules Prefix Main Table
 Query: Select * From coo_rules_prefix
        Where  pidname = :Product
**************************************/
create table erp.coo_rules_prefix (
pidname text,
prefix  text,
country text,
dhrule  text,
hco     text,
rectime timestamp,
primary key ((pidname),prefix));

/**********************************************
 COO Rules Supplier Prefix Main Table
 Query: Select * From coo_rules_supplier_prefix
        Where  prefix = :Prefix
***********************************************/
create table erp.coo_rules_supplier_prefix (
prefix  text,
country text,
rectime timestamp,
primary key (prefix));

/**********************************
 COO Rules BWH Main Table
 Query: Select * From coo_rules_bwh
        Where  pidnamr = :Product
        And    invcountry = :COO
***********************************/
create table erp.coo_rules_bwh (
pidname    text,
invcountry text,
co         text,
rectime    timestamp,
primary key ((pidname),invcountry));

/**********************************
 Sites Main Table
 Query: Select * From sites
        Where  site_id = :SiteID
***********************************/
create table erp.sites (
site_id           int,
site_code         text,
site_name         text,
country_code      text,
organization_id   int,
organization_code text,
time_zone         text,
time_offset       int,
daylight_savings  text,
rectime           timestamp,
primary key (site_id));

/********************************
 Machines Main Table
 Query: Select * From machines
        Where  machine = :Machine
*********************************/
create table erp.machines (
machine      text,
status       text,
site_id      int,
country_code text,
rectime      timestamp,
primary key (machine));

/*************************************
 SWCNF Main Table
 Query: Select * From swcnf
        Where  product_id = :ProductID
**************************************/
create table erp.swcnf (
product_id        text,
uuttype           text,
image_name        text,
version           text,
config            text,
image_id          int,
group_id          int,
dos_name          text,
boot_image        text,
cco_check         text,
initiated_version text,
var1              text,
var2              text,
var3              text,
var4              text,
var5              text,
image_type        text,
imagesize         bigint,
md5               text,
flashchksum       text,
cco_location      text,
product_label     text,
effective_date    timestamp,
end_date          timestamp,
lastupdated_by    text,
lastupdated_on    timestamp,
id                int,
primary key (product_id));

/************************************************
 SWCNF Query by time series data
 Query: Select * From tsd_swcnf
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_swcnf (
tsd_date          bigint,
tsd_timestamp     timestamp,
product_id        text,
uuttype           text,
image_name        text,
version           text,
config            text,
image_id          int,
group_id          int,
dos_name          text,
boot_image        text,
cco_check         text,
initiated_version text,
var1              text,
var2              text,
var3              text,
var4              text,
var5              text,
image_type        text,
imagesize         bigint,
md5               text,
flashchksum       text,
cco_location      text,
product_label     text,
effective_date    timestamp,
end_date          timestamp,
lastupdated_by    text,
lastupdated_on    timestamp,
id                int,
primary key ((tsd_date),tsd_timestamp,product_id))
with default_time_to_live = 7776000;

/*************************************
 SWCNF History Main Table
 Query: Select * From swcnf_history
        Where  product_id = :ProductID
**************************************/
create table erp.swcnf_history (
product_id        text,
uuttype           text,
image_name        text,
version           text,
config            text,
image_id          int,
group_id          int,
dos_name          text,
boot_image        text,
cco_check         text,
initiated_version text,
var1              text,
var2              text,
var3              text,
var4              text,
var5              text,
image_type        text,
imagesize         bigint,
md5               text,
flashchksum       text,
cco_location      text,
product_label     text,
effective_date    timestamp,
end_date          timestamp,
lastupdated_by    text,
lastupdated_on    timestamp,
id                int,
primary key ((product_id),lastupdated_on));

/************************************************
 SWCNF History Query by time series data
 Query: Select * From tsd_swcnf_history
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_swcnf_history (
tsd_date          bigint,
tsd_timestamp     timestamp,
product_id        text,
uuttype           text,
image_name        text,
version           text,
config            text,
image_id          int,
group_id          int,
dos_name          text,
boot_image        text,
cco_check         text,
initiated_version text,
var1              text,
var2              text,
var3              text,
var4              text,
var5              text,
image_type        text,
imagesize         bigint,
md5               text,
flashchksum       text,
cco_location      text,
product_label     text,
effective_date    timestamp,
end_date          timestamp,
lastupdated_by    text,
lastupdated_on    timestamp,
id                int,
primary key ((tsd_date),tsd_timestamp,product_id,lastupdated_on))
with default_time_to_live = 7776000;

/*************************************
 CNFV2 Main Table
 Query: Select * From cnfv2
        Where  top_line_id = :TopLineID
        And    lineid = :LineID
**************************************/
create table erp.cnfv2 (
top_lineid       int,
lineid           int,
ob_trans_id      int,
linenum          int,
parent_lineid    int,
prod_name        text,
qty              int,
image_name       text,
image_version    text,
boot_image       text,
line_number      int,
promise_date     timestamp,
ordered_quantity int,
order_number     int,
customer_id      int,
customer_name    text,
set_name         text,
fcd_date         timestamp,
dispatch_date    timestamp,
rohs             text,
level            int,
atlinenum        int,
lastupdated_on   timestamp,
lastupdated_by   text,
primary key ((top_lineid),lineid))
with default_time_to_live = 15552000;

/************************************************
 CNFV2 Query by time series data
 Query: Select * From tsd_cnfv2
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cnfv2 (
tsd_date         bigint,
tsd_timestamp    timestamp,
top_lineid       int,
lineid           int,
ob_trans_id      int,
linenum          int,
parent_lineid    int,
prod_name        text,
qty              int,
image_name       text,
image_version    text,
boot_image       text,
line_number      int,
promise_date     timestamp,
ordered_quantity int,
order_number     int,
customer_id      int,
customer_name    text,
set_name         text,
fcd_date         timestamp,
dispatch_date    timestamp,
rohs             text,
level            int,
atlinenum        int,
lastupdated_on   timestamp,
lastupdated_by   text,
primary key ((tsd_date),tsd_timestamp,top_lineid,lineid))
with default_time_to_live = 7776000;

/*************************************
 CNF Specials Main Table
 Query: Select * From cnfspecials
        Where  top_line_id = :TopLineID
        And    lineid = :LineID
**************************************/
create table erp.cnfspecials (
top_lineid       int,
lineid           int,
linenum          int,
parent_lineid    int,
prod_name        text,
qty              int,
image_name       text,
image_version    text,
boot_image       text,
line_number      int,
promise_date     timestamp,
ordered_quantity int,
order_number     int,
customer_id      int,
customer_name    text,
set_name         text,
fcd_date         timestamp,
dispatch_date    timestamp,
rohs             text,
level            int,
atlinenum        int,
isprod           int,
lastupdated_on   timestamp,
lastupdated_by   text,
primary key ((top_lineid),lineid));

/************************************************
 CNF Specials Query by time series data
 Query: Select * From tsd_cnfspecials
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cnfspecials (
tsd_date         bigint,
tsd_timestamp    timestamp,
top_lineid       int,
lineid           int,
linenum          int,
parent_lineid    int,
prod_name        text,
qty              int,
image_name       text,
image_version    text,
boot_image       text,
line_number      int,
promise_date     timestamp,
ordered_quantity int,
order_number     int,
customer_id      int,
customer_name    text,
set_name         text,
fcd_date         timestamp,
dispatch_date    timestamp,
rohs             text,
level            int,
atlinenum        int,
isprod           int,
lastupdated_on   timestamp,
lastupdated_by   text,
primary key ((tsd_date),tsd_timestamp,top_lineid,lineid))
with default_time_to_live = 7776000;

/*************************************
 CNFEXP Main Table
 Query: Select * From cnfexp
        Where  product_id = :ProductID
        And    cnfexp_key = :CNFExpKey
**************************************/
create table erp.cnfexp (
product_id     text,
cnfexp_key     text,
id             int,
cnfexp_value   text,
lastupdated_by text,
lastupdated_on timestamp,
primary key ((product_id),cnfexp_key));

/************************************************
 CNFEXP Query by time series data
 Query: Select * From tsd_cnfexp
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cnfexp (
tsd_date       bigint,
tsd_timestamp  timestamp,
product_id     text,
cnfexp_key     text,
id             int,
cnfexp_value   text,
lastupdated_by text,
lastupdated_on timestamp,
primary key ((tsd_date),tsd_timestamp,product_id,cnfexp_key))
with default_time_to_live = 7776000;

/****************************************
 CNF Main Table
 Query: Select * From cnf
        Where  cnflineid = :CNFLineID
        And    cnfsubline1 = :CNFSubLine1
        And    cnfsubline2 = :CNFSubLine2
*****************************************/
create table erp.cnf (
cnflineid      int,
cnfsubline1    int,
cnfsubline2    int,
cnfmachine     text,
cnfrectime     timestamp,
cnfprodname    text,
cnfuuttype     text,
cnffixedconf   text,
cnfvarconf     text,
cnfsoftrev     text,
cnfsoftconf    text,
cnfsoftdldfile text,
cnfsorder      int,
cnfmajline     int,
cnfshipnum     int,
cnfnumsystems  int,
cnframsize     int,
cnfflashsize   int,
cnfsharesize   int,
cnfnvsize      int,
cnfpcmcia1     int,
cnfpcmcia2     int,
cnforgid       int,
cnfbuildnum    int,
cnfswname      text,
cnfprodarraya  text,
cnfprodarrayb  text,
cnfextra       int,
cnfpromdate    timestamp,
cnftimestamp   timestamp,
cnffcddate     timestamp,
cnfcustname    text,
primary key ((cnflineid),cnfsubline1,cnfsubline2))
with default_time_to_live = 15552000;

/************************************************
 CNF Query by time series data
 Query: Select * From tsd_cnf
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cnf (
tsd_date       bigint,
tsd_timestamp  timestamp,
cnflineid      int,
cnfsubline1    int,
cnfsubline2    int,
cnfmachine     text,
cnfrectime     timestamp,
cnfprodname    text,
cnfuuttype     text,
cnffixedconf   text,
cnfvarconf     text,
cnfsoftrev     text,
cnfsoftconf    text,
cnfsoftdldfile text,
cnfsorder      int,
cnfmajline     int,
cnfshipnum     int,
cnfnumsystems  int,
cnframsize     int,
cnfflashsize   int,
cnfsharesize   int,
cnfnvsize      int,
cnfpcmcia1     int,
cnfpcmcia2     int,
cnforgid       int,
cnfbuildnum    int,
cnfswname      text,
cnfprodarraya  text,
cnfprodarrayb  text,
cnfextra       int,
cnfpromdate    timestamp,
cnftimestamp   timestamp,
cnffcddate     timestamp,
cnfcustname    text,
primary key ((tsd_date),tsd_timestamp,cnflineid,cnfsubline1,cnfsubline2))
with default_time_to_live = 7776000;

/*****************************************
 CNF Work Main Table
 Query: Select * From cnfwork
        Where  cnfwprodname = :CNFProdName
******************************************/
create table erp.cnfwork (
cnfwprodname    text,
cnfwrectime     timestamp,
cnfwdesc        text,
cnfwrev         text,
cnfwhassernum   int,
cnfwuuttype     text,
cnfwsoftrev     text,
cnfwsoftconf    text,
cnfwsoftdldfile text,
cnfwfixedconf   text,
cnfwvarconf     text,
cnfwramsize     int,
cnfwflashsize   int,
cnfwsharesize   int,
cnfwnvsize      int,
cnfwintmemsize  int,
cnfwpcmcia1     int,
cnfwpcmcia2     int,
cnfwcell        text,
cnfwchecksum    text,
cnfwdosfile     text,
cnfwlabeltype   int,
cnfwcomments    text,
cnfwdosvol      int,
cnfwnumdisks    int,
cnfwswloc       text,
cnfwvar1        text,
cnfwvar2        text,
cnfwvar3        text,
cnfwvar4        text,
cnfwvar5        text,
cnfwobstime     timestamp,
cnfwlevel       int,
cnfwrecord      int,
cnfwoptions     int,
cnfwfilesize    int,
cnfwfcksum      int,
cnfwbuildloc    text,
cnfwbuildnum    int,
cnfwprodarraya  text,
cnfwprodarrayb  text,
cnfwtimestamp   timestamp,
primary key (cnfwprodname));

/************************************************
 CNF Work Query by time series data
 Query: Select * From tsd_cnfwork
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table erp.tsd_cnfwork (
tsd_date        bigint,
tsd_timestamp   timestamp,
cnfwprodname    text,
cnfwrectime     timestamp,
cnfwdesc        text,
cnfwrev         text,
cnfwhassernum   int,
cnfwuuttype     text,
cnfwsoftrev     text,
cnfwsoftconf    text,
cnfwsoftdldfile text,
cnfwfixedconf   text,
cnfwvarconf     text,
cnfwramsize     int,
cnfwflashsize   int,
cnfwsharesize   int,
cnfwnvsize      int,
cnfwintmemsize  int,
cnfwpcmcia1     int,
cnfwpcmcia2     int,
cnfwcell        text,
cnfwchecksum    text,
cnfwdosfile     text,
cnfwlabeltype   int,
cnfwcomments    text,
cnfwdosvol      int,
cnfwnumdisks    int,
cnfwswloc       text,
cnfwvar1        text,
cnfwvar2        text,
cnfwvar3        text,
cnfwvar4        text,
cnfwvar5        text,
cnfwobstime     timestamp,
cnfwlevel       int,
cnfwrecord      int,
cnfwoptions     int,
cnfwfilesize    int,
cnfwfcksum      int,
cnfwbuildloc    text,
cnfwbuildnum    int,
cnfwprodarraya  text,
cnfwprodarrayb  text,
cnfwtimestamp   timestamp,
primary key ((tsd_date),tsd_timestamp,cnfwprodname))
with default_time_to_live = 7776000;

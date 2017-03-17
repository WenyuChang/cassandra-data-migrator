use mfgprod;

/***********************************
 Test Reults Main Table
 Query: Select * From test_results
        Where  sernum = :SerialNo
        And    rectime > :TimeStamp
        Limit  100
************************************/
create table mfgprod.test_results (
sernum       text,
rectime      timestamp,
machine      text,
area         text,
uuttype      text,
passfail     text,
bfstatus     text,
mode         text,
parentsernum text,
server       text,
tst_id       timestamp,
attributes   map <text,text>,
primary key ((sernum),rectime))
with clustering order by (rectime desc);

/*******************************************************
 Test Reults Query by time series data
 Query: Select * From tsd_test_results
        Where  tsd_key = :LastTimeStampYYYYMMDDHH24MISS
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
********************************************************/
create table mfgprod.tsd_test_results (
tsd_key       bigint,
tsd_timestamp timestamp,
sernum        text,
rectime       timestamp,
machine       text,
area          text,
uuttype       text,
passfail      text,
bfstatus      text,
mode          text,
parentsernum  text,
server        text,
tst_id        timestamp,
attributes    map <text,text>,
primary key ((tsd_key),tsd_timestamp,sernum,rectime))
with default_time_to_live = 2592000;

/******************************************************
 Test Reults Query by time series data (bfstatus = YES)
 Query: Select * From tsd_test_results_by_bfstatus
        Where  tsd_key = :LastTimeStampYYYYMMDDHH24
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*******************************************************/
create table mfgprod.tsd_test_results_by_bfstatus (
tsd_key       bigint,
tsd_timestamp timestamp,
sernum        text,
rectime       timestamp,
uuttype       text,
area          text,
bfstatus      text,
passfail      text,
primary key ((tsd_key),tsd_timestamp,sernum,rectime))
with default_time_to_live = 7776000;

/************************************************
 Test Reults Query by parentsernum
 Query: Select * From test_results_by_parentsernum
        Where  parentsernum = :SerialNo
*************************************************/
create table mfgprod.test_results_by_parentsernum (
parentsernum text,
sernum       text,
rectime      timestamp,
uuttype      text,
area         text,
passfail     text,
primary key ((parentsernum),sernum))
with default_time_to_live = 7776000;

/*************************************
 Test Events
 Query: Select * From test_events
        Where  event_type = :EventType
        And    event_key = :EventKey
        Limit  100
**************************************/
create table mfgprod.test_events (
event_type int,
event_key  text,
event_time timestamp,
name       text,
value      text,
primary key ((event_type,event_key),event_time,name))
with clustering order by (event_time desc);

/***********************************
 MAC Ranges Main Table
 Query: Select * From mac_oui
        Where  oui = :MACOUI
        And    eadr >= :StartMACAddr
        Limit  100
************************************/
create table mfgprod.mac_oui (
oui        bigint,
sadr       bigint,
eadr       bigint,
rectime    timestamp,
assigntime timestamp,
req        text,
area       text,
qty        int,
machine    text,
fname      text,
seq        int,
comments   text,
logfname   text,
logline    int,
primary key ((oui),eadr,sadr));

/************************************************
 MAC Ranges Query by time series data
 Query: Select * From tsd_mac_oui
        Where  tsd_date = :LastTimeStampYYYYMMDD
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*************************************************/
create table mfgprod.tsd_mac_oui (
tsd_key       bigint,
tsd_timestamp timestamp,
oui           bigint,
sadr          bigint,
eadr          bigint,
rectime       timestamp,
assigntime    timestamp,
req           text,
area          text,
qty           int,
machine       text,
fname         text,
seq           int,
comments      text,
logfname      text,
logline       int,
primary key ((tsd_key),tsd_timestamp,oui,eadr,sadr))
with default_time_to_live = 7776000;

/***********************************************
 MAC Bindings Main Table
 Query: Select * From mac_bindings
        Where  partition_key = :StartMACAddr8Char
        And    mac_end_addr >= :StartMACAddr
************************************************/
create table mfgprod.mac_bindings (
partition_key  bigint,
mac_start_addr bigint,
mac_end_addr   bigint,
serial_number  text,
record_time    timestamp,
block_size     bigint,
machine        text,
uuttype        text,
area           text,
request        text,
error_code     text,
timestamp      timestamp,
primary key ((partition_key),mac_end_addr,mac_start_addr,serial_number,record_time));

/***************************************************
 MAC Bindings Query by time series data
 Query: Select * From tsd_mac_bindings
        Where  tsd_date = :LastTimeStampYYYYMMDDHH24
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
****************************************************/
create table mfgprod.tsd_mac_bindings (
tsd_key        bigint,
tsd_timestamp  timestamp,
partition_key  bigint,
mac_start_addr bigint,
mac_end_addr   bigint,
serial_number  text,
record_time    timestamp,
block_size     bigint,
machine        text,
uuttype        text,
area           text,
request        text,
error_code     text,
timestamp      timestamp,
primary key ((tsd_key),tsd_timestamp,partition_key,mac_end_addr,mac_start_addr,serial_number,record_time))
with default_time_to_live = 2592000;

/**************************************************
 MAC Bindings Query by serial number
 Query: Select * From mac_bindings_by_serial_number
        Where  serial_number = :SerialNo
        Limit  100
***************************************************/
create table mfgprod.mac_bindings_by_serial_number (
serial_number  text,
mac_start_addr bigint,
mac_end_addr   bigint,
record_time    timestamp,
block_size     bigint,
machine        text,
uuttype        text,
area           text,
request        text,
error_code     text,
timestamp      timestamp,
primary key ((serial_number),mac_end_addr,mac_start_addr,record_time));

/*******************************************************
 MAC Errors Q - propgate MAC Errors across clusters
 Insert into this table triggers updates on MAC Bindings
 Query: No Read required
 *******************************************************/
create table mfgprod.mac_errors_q (
partition_key  bigint,
mac_start_addr bigint,
mac_end_addr   bigint,
serial_number  text,
record_time    timestamp,
block_size     bigint,
machine        text,
uuttype        text,
area           text,
request        text,
error_code     text,
timestamp      timestamp,
primary key ((partition_key),mac_end_addr,mac_start_addr,serial_number,record_time))
with default_time_to_live = 2592000;

/***************************************
 Serial Numbers Main Table
 Query: Select * From serial_number
        Where  serial_number = :SerialNo
        And    item_number = :ItemNumber
****************************************/
create table mfgprod.serial_numbers (
serial_number      text,
item_number        text,
line_id            bigint,
rts_status         text,
ship_status        text,
par_timestamp      timestamp,
test_timestamp     timestamp,
ship_timestamp     timestamp,
mfg_attributes     text,
ship_attributes    text,
validation_message text,
primary key ((serial_number),item_number));

/***************************************************
 Serial Numbers Query by time series data
 Query: Select * From tsd_serial_numbers
        Where  tsd_date = :LastTimeStampYYYYMMDDHH24
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*****************************************************/
create table mfgprod.tsd_serial_numbers (
tsd_key            bigint,
tsd_timestamp      timestamp,
serial_number      text,
item_number        text,
line_id            bigint,
rts_status         text,
ship_status        text,
par_timestamp      timestamp,
test_timestamp     timestamp,
ship_timestamp     timestamp,
mfg_attributes     text,
ship_attributes    text,
validation_message text,
primary key ((tsd_key),tsd_timestamp,serial_number,item_number))
with default_time_to_live = 2592000;

/*****************************************
 Serial Numbers Event History
 Query: Select * From serial_number_events
        Where  serial_number = :SerialNo
        And    item_number = :ItemNumber
        And    event_type = 'PAR'
        Limit  100
******************************************/
create table mfgprod.serial_numbers_events (
serial_number      text,
item_number        text,
line_id            bigint,
event_type         int,
event_timestamp    timestamp,
event_status       text,
mfg_attributes     text,
ship_attributes    text,
validation_message text,
primary key ((serial_number),item_number,event_type,event_timestamp))
with default_time_to_live = 7776000;

/***************************************
 Serial Genealogy Main Table
 Query: Select * From serial_genealogy
        Where  serial_number = :SerialNo
        And    item_number = :ItemNumber
****************************************/
create table mfgprod.serial_genealogy (
serial_number           text,
item_number             text,
record_time             timestamp,
area                    text,
part_number             text,
tan                     text,
paste_part_number       text,
rohs_attribute          text,
traceability_status     int,
level                   int,
sort_order              text,
validation_message      text,
parent_serial_number    text,
parent_item_number      text,
top_model_serial_number text,
top_model_item_number   text,
site_id                 int,
updated_date            timestamp,
primary key ((serial_number),item_number));

/***************************************************
 Serial Genealogy Query by time series data
 Query: Select * From tsd_serial_genealogy
        Where  tsd_date = :LastTimeStampYYYYMMDDHH24
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*****************************************************/
create table mfgprod.tsd_serial_genealogy (
tsd_key                 bigint,
tsd_timestamp           timestamp,
serial_number           text,
item_number             text,
record_time             timestamp,
area                    text,
part_number             text,
tan                     text,
paste_part_number       text,
rohs_attribute          text,
traceability_status     int,
level                   int,
sort_order              text,
validation_message      text,
parent_serial_number    text,
parent_item_number      text,
top_model_serial_number text,
top_model_item_number   text,
site_id                 int,
updated_date            timestamp,
primary key ((tsd_key),tsd_timestamp,serial_number,item_number))
with default_time_to_live = 2592000;

/****************************************************************
 Serial Genealogy Query by top model serial number
 Query: Select * From serial_genealogy_by_top_model_serial_number
        Where  top_model_serial_number = :SerialNo
        And    top_model_item_number = :ItemNumber
*****************************************************************/
create table mfgprod.serial_genealogy_by_top_model_serial_number (
top_model_serial_number text,
top_model_item_number   text,
serial_number           text,
item_number             text,
record_time             timestamp,
area                    text,
part_number             text,
tan                     text,
paste_part_number       text,
rohs_attribute          text,
traceability_status     int,
level                   int,
sort_order              text,
parent_serial_number    text,
parent_item_number      text,
site_id                 int,
updated_date            timestamp,
primary key ((top_model_serial_number),top_model_item_number,sort_order));

/********************************************
 Serial Genealogy Event History
 Query: Select * From serial_genealogy_events
        Where  serial_number = :SerialNo
        And    item_number = :ItemNumber
        Limit  100
*********************************************/
create table mfgprod.serial_genealogy_events (
serial_number           text,
item_number             text,
record_time             timestamp,
area                    text,
part_number             text,
tan                     text,
paste_part_number       text,
rohs_attribute          text,
traceability_status     int,
level                   int,
sort_order              text,
validation_message      text,
parent_serial_number    text,
parent_item_number      text,
top_model_serial_number text,
top_model_item_number   text,
site_id                 int,
updated_date            timestamp,
primary key ((serial_number),item_number,updated_date))
with clustering order by (item_number asc,updated_date desc)
and  default_time_to_live = 7776000;

/***************************************************
 Serial Genealogy Error Q time series data
 Query: Select * From tsd_serial_genealogy_errors_q
        Where  tsd_date = :LastTimeStampYYYYMMDDHH24
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
*****************************************************/
create table mfgprod.tsd_serial_genealogy_errors_q (
tsd_key       bigint,
tsd_timestamp timestamp,
serial_number text,
item_number   text,
record_time   timestamp,
error_status  text,
error_message text,
primary key ((tsd_key),tsd_timestamp,serial_number,item_number))
with default_time_to_live = 2592000;

/********************************************
 PAR Request Main Table
 Query: Select * From par_requests
        Where  serial_number = :SerialNo
        And    item_number = :ItemNumber
        Limit  100
*********************************************/
create table mfgprod.par_requests (
serial_number  text,
item_number    text,
par_timestamp  timestamp,
tracking_id    text,
site_id        int,
site_type      text,
mfg_attributes text,
primary key ((serial_number),item_number,par_timestamp))
with default_time_to_live = 7776000;

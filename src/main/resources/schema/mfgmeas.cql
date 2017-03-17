use mfgmeas;

/*****************************************
 Test Steps Main Table
 Query: Select * From test_steps
        Where  sernum = :SerialNo
        And    uuttype = :UUTType
        And    area = :Area
        And    tst_id = :TSTID
        Limit  100
******************************************/
create table mfgmeas.test_steps (
sernum     text,
uuttype    text,
area       text,
tst_id     timestamp,
rectime    timestamp,
uniq_id    int,
machine    text,
step_id    text,
starttime  timestamp,
endtime    timestamp,
passfail   text,
attributes map <text,text>,
primary key ((sernum,uuttype,area),tst_id,rectime,uniq_id))
with default_time_to_live = 2592000;

/*******************************************************
 Test Steps Query by time series data
 Time to Live - 90 Days
 Query: Select * From tsd_test_steps
        Where  tsd_key = :LastTimeStampYYYYMMDDHH24MISS
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
********************************************************/
create table mfgmeas.tsd_test_steps (
tsd_key       bigint,
tsd_timestamp timestamp,
sernum        text,
uuttype       text,
area          text,
tst_id        timestamp,
rectime       timestamp,
uniq_id       int,
machine       text,
step_id       text,
starttime     timestamp,
endtime       timestamp,
passfail      text,
attributes    map <text,text>,
primary key ((tsd_key),tsd_timestamp,sernum,uuttype,area,tst_id,rectime,uniq_id))
with default_time_to_live = 2592000;

/*****************************************
 Test Measures Main Table
 Query: Select * From test_measures
        Where  sernum = :SerialNo
        And    uuttype = :UUTType
        And    area = :Area
        And    tst_id = :TSTID
        Limit  100
******************************************/
create table mfgmeas.test_measures (
sernum     text,
uuttype    text,
area       text,
tst_id     timestamp,
rectime    timestamp,
uniq_id    int,
machine    text,
step_id    text,
limit_id   text,
name       text,
meastime   timestamp,
value      text,
type       text,
passfail   text,
attributes map <text,text>,
primary key ((sernum,uuttype,area),tst_id,rectime,uniq_id))
with default_time_to_live = 2592000;

/*******************************************************
 Test Measures Query by time series data
 Time to Live - 90 Days
 Query: Select * From tsd_test_measures
        Where  tsd_key = :LastTimeStampYYYYMMDDHH24MISS
        And    tsd_timestamp >= :LastTimeStamp
        Limit  100
********************************************************/
create table mfgmeas.tsd_test_measures (
tsd_key       bigint,
tsd_timestamp timestamp,
sernum        text,
uuttype       text,
area          text,
tst_id        timestamp,
rectime       timestamp,
uniq_id       int,
machine       text,
step_id       text,
limit_id      text,
name          text,
meastime      timestamp,
value         text,
type          text,
passfail      text,
attributes    map <text,text>,
primary key ((tsd_key),tsd_timestamp,sernum,uuttype,area,tst_id,rectime,uniq_id))
with default_time_to_live = 2592000;

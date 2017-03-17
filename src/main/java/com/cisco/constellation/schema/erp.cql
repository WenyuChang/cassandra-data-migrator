^[[?1034h
CREATE KEYSPACE pq WITH replication = {'class': 'NetworkTopologyStrategy', 'Cassandra': '1'}  AND durable_writes = true;

CREATE TABLE erp.mrcs (
    product text,
    id int,
    business_unit text,
    cas_timestamp timestamp,
    clei text,
    eci text,
    eco_type text,
    last_update_date timestamp,
    last_updated_by text,
    org text,
    pca text,
    pn text,
    pn_eco text,
    pn_parent text,
    pn_rev text,
    pn_sch_date timestamp,
    prod_eco text,
    prod_rev text,
    prod_sch_date timestamp,
    prod_ver text,
    product_family text,
    tsd_timestamp timestamp,
    upc text,
    PRIMARY KEY (product, id)
) WITH CLUSTERING ORDER BY (id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppareas_common (
    tsd_key bigint,
    tsd_timestamp timestamp,
    area text,
    autotestvalue text,
    cas_timestamp timestamp,
    description text,
    PRIMARY KEY (tsd_key, tsd_timestamp, area)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, area ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmldeleted_dev (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    batchid text,
    cas_timestamp timestamp,
    checkout text,
    copied_version int,
    deleted_from_prod boolean,
    deletedby text,
    deptid text,
    description text,
    extraid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    rootobject boolean,
    tsd_to_delete boolean,
    version int,
    xml text,
    xmlout text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.pidvid_by_base_pid (
    base_pid text,
    pid text,
    tan text,
    vid text,
    base_tan text,
    stat int,
    PRIMARY KEY (base_pid, pid, tan, vid)
) WITH CLUSTERING ORDER BY (pid ASC, tan ASC, vid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.pidvid (
    pid text,
    tan text,
    vid text,
    base_pid text,
    base_tan text,
    cas_timestamp timestamp,
    created_by int,
    creation_date timestamp,
    last_updated_by int,
    last_updated_date timestamp,
    stat int,
    tsd_timestamp timestamp,
    PRIMARY KEY (pid, tan, vid)
) WITH CLUSTERING ORDER BY (tan ASC, vid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_swcnf (
    tsd_key bigint,
    tsd_timestamp timestamp,
    product_id text,
    boot_image text,
    cas_timestamp timestamp,
    cco_check text,
    cco_location text,
    config text,
    dos_name text,
    effective_date timestamp,
    end_date timestamp,
    flashchksum text,
    group_id int,
    id int,
    image_id int,
    image_name text,
    image_type text,
    imagesize bigint,
    initiated_version text,
    lastupdated_by text,
    lastupdated_on timestamp,
    md5 text,
    product_label text,
    uuttype text,
    var1 text,
    var2 text,
    var3 text,
    var4 text,
    var5 text,
    version text,
    PRIMARY KEY (tsd_key, tsd_timestamp, product_id)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, product_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.servers (
    serverid int PRIMARY KEY,
    backupid int,
    cas_timestamp timestamp,
    description text,
    locationid int,
    name text,
    siteid int,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cnfexp (
    product_id text,
    cnfexp_key text,
    cas_timestamp timestamp,
    cnfexp_value text,
    id int,
    lastupdated_by text,
    lastupdated_on timestamp,
    tsd_timestamp timestamp,
    PRIMARY KEY (product_id, cnfexp_key)
) WITH CLUSTERING ORDER BY (cnfexp_key ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cmpd (
    prodpartnum text,
    prodpartrev text,
    grouprecnum int,
    additionalinfo text,
    cas_timestamp timestamp,
    description text,
    ecodevnum text,
    enddate timestamp,
    function text,
    functionstatus int,
    machine text,
    optionnum3 int,
    optionstr1 text,
    optionstr2 text,
    passwdfamily text,
    prodcodename text,
    prodname text,
    recordsharing text,
    recordstatus text,
    rectime timestamp,
    runitfamily text,
    startdate timestamp,
    testprocess text,
    testsite text,
    timestatus text,
    tsd_timestamp timestamp,
    username text,
    PRIMARY KEY (prodpartnum, prodpartrev, grouprecnum)
) WITH CLUSTERING ORDER BY (prodpartrev ASC, grouprecnum ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmlrefid_prod (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    refid text,
    cas_timestamp timestamp,
    tsd_to_delete boolean,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid, refid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC, refid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmlrelease_dev (
    tsd_key bigint,
    tsd_timestamp timestamp,
    requestid text,
    approved_by text,
    approved_date timestamp,
    cas_timestamp timestamp,
    comment text,
    copied_objects int,
    deleted_objects int,
    deptid text,
    deptname text,
    items_xml text,
    items_xml_detailed text,
    machine text,
    objectsdeptid text,
    process_end_time timestamp,
    process_start_time timestamp,
    recipients text,
    rectime timestamp,
    reject_reason text,
    report_html text,
    retries int,
    status text,
    username text,
    wipe_out_prod boolean,
    PRIMARY KEY (tsd_key, tsd_timestamp, requestid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, requestid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.families (
    familyid int PRIMARY KEY,
    cas_timestamp timestamp,
    description text,
    name text,
    tsd_timestamp timestamp,
    username text,
    xfer_column text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.master_template (
    attribute_group text,
    attribute_name text,
    cas_timestamp timestamp,
    created_date timestamp,
    description text,
    is_enabled boolean,
    is_fpav_attribute boolean,
    is_hidden boolean,
    max_length int,
    min_length int,
    tsd_timestamp timestamp,
    updated_date timestamp,
    validation_type text,
    validation_values text,
    PRIMARY KEY (attribute_group, attribute_name)
) WITH CLUSTERING ORDER BY (attribute_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.machines (
    machine text PRIMARY KEY,
    cas_timestamp timestamp,
    country_code text,
    cppversion text,
    description text,
    family text,
    familyid int,
    hostid bigint,
    hwid int,
    ipaddr bigint,
    machineid int,
    osid int,
    rectime timestamp,
    replication_type text,
    site_id int,
    status text,
    tsd_timestamp timestamp,
    username text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cmpdit (
    tsd_key bigint,
    tsd_timestamp timestamp,
    grouprecnum int,
    fieldnum int,
    cas_timestamp timestamp,
    description text,
    function text,
    functionstatus int,
    optionnum3 int,
    optionstr1 text,
    optionstr2 text,
    prodname text,
    rectime timestamp,
    totfieldnum int,
    type text,
    value text,
    PRIMARY KEY (tsd_key, tsd_timestamp, grouprecnum, fieldnum)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, grouprecnum ASC, fieldnum ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.pidvid_by_base_tan (
    base_tan text,
    tan text,
    pid text,
    vid text,
    base_pid text,
    stat int,
    PRIMARY KEY (base_tan, tan, pid, vid)
) WITH CLUSTERING ORDER BY (tan ASC, pid ASC, vid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.coo_rules_prefix (
    pidname text,
    prefix text,
    cas_timestamp timestamp,
    country text,
    dhrule text,
    hco text,
    rectime timestamp,
    tsd_timestamp timestamp,
    PRIMARY KEY (pidname, prefix)
) WITH CLUSTERING ORDER BY (prefix ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.uuttypes (
    uutid int PRIMARY KEY,
    cas_timestamp timestamp,
    description text,
    rectime timestamp,
    tsd_timestamp timestamp,
    uuttype text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_swcnf_history (
    tsd_key bigint,
    tsd_timestamp timestamp,
    product_id text,
    lastupdated_on timestamp,
    boot_image text,
    cas_timestamp timestamp,
    cco_check text,
    cco_location text,
    config text,
    dos_name text,
    effective_date timestamp,
    end_date timestamp,
    flashchksum text,
    group_id int,
    id int,
    image_id int,
    image_name text,
    image_type text,
    imagesize bigint,
    initiated_version text,
    lastupdated_by text,
    md5 text,
    product_label text,
    uuttype text,
    var1 text,
    var2 text,
    var3 text,
    var4 text,
    var5 text,
    version text,
    PRIMARY KEY (tsd_key, tsd_timestamp, product_id, lastupdated_on)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, product_id ASC, lastupdated_on ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_rohs_sn_ele_pid (
    tsd_key bigint,
    tsd_timestamp timestamp,
    pid text,
    sn_element_pid text,
    attribute1 text,
    attribute2 text,
    attribute3 text,
    cas_timestamp timestamp,
    creation_date timestamp,
    data_element_id int,
    last_update_date timestamp,
    quantity int,
    timestamp timestamp,
    PRIMARY KEY (tsd_key, tsd_timestamp, pid, sn_element_pid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, pid ASC, sn_element_pid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.coo_rules (
    prodname text PRIMARY KEY,
    cas_timestamp timestamp,
    newrule text,
    rectime timestamp,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_mrcs (
    tsd_key bigint,
    tsd_timestamp timestamp,
    product text,
    id int,
    business_unit text,
    cas_timestamp timestamp,
    clei text,
    eci text,
    eco_type text,
    last_update_date timestamp,
    last_updated_by text,
    org text,
    pca text,
    pn text,
    pn_eco text,
    pn_parent text,
    pn_rev text,
    pn_sch_date timestamp,
    prod_eco text,
    prod_rev text,
    prod_sch_date timestamp,
    prod_ver text,
    product_family text,
    upc text,
    PRIMARY KEY (tsd_key, tsd_timestamp, product, id)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, product ASC, id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.sites (
    site_id int PRIMARY KEY,
    cas_timestamp timestamp,
    country_code text,
    daylight_savings text,
    dev1 text,
    location_type int,
    organization_code text,
    organization_id int,
    rectime timestamp,
    repair_sites text,
    serverid int,
    site_code text,
    site_name text,
    siteid int,
    time_offset int,
    time_zone text,
    tsd_timestamp timestamp,
    username text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.dataset_attributes (
    dataset_name text,
    attribute_name text,
    cas_timestamp timestamp,
    data_source text,
    description text,
    tsd_timestamp timestamp,
    PRIMARY KEY (dataset_name, attribute_name)
) WITH CLUSTERING ORDER BY (attribute_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cnf (
    cnflineid int,
    cnfsubline1 int,
    cnfsubline2 int,
    cas_timestamp timestamp,
    cnfbuildnum int,
    cnfcustname text,
    cnfextra int,
    cnffcddate timestamp,
    cnffixedconf text,
    cnfflashsize int,
    cnfmachine text,
    cnfmajline int,
    cnfnumsystems int,
    cnfnvsize int,
    cnforgid int,
    cnfpcmcia1 int,
    cnfpcmcia2 int,
    cnfprodarraya text,
    cnfprodarrayb text,
    cnfprodname text,
    cnfpromdate timestamp,
    cnframsize int,
    cnfrectime timestamp,
    cnfsharesize int,
    cnfshipnum int,
    cnfsoftconf text,
    cnfsoftdldfile text,
    cnfsoftrev text,
    cnfsorder int,
    cnfswname text,
    cnftimestamp timestamp,
    cnfuuttype text,
    cnfvarconf text,
    tsd_timestamp timestamp,
    PRIMARY KEY (cnflineid, cnfsubline1, cnfsubline2)
) WITH CLUSTERING ORDER BY (cnfsubline1 ASC, cnfsubline2 ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 15552000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_goldboards_prod (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    sernum text,
    countername text,
    cas_timestamp timestamp,
    countervalue int,
    timestamp timestamp,
    tsd_to_delete boolean,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid, sernum, countername)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC, sernum ASC, countername ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_rohs_serial_numbers (
    tsd_key bigint,
    tsd_timestamp timestamp,
    base_item_number text,
    serial_id int,
    attribute_value text,
    cas_timestamp timestamp,
    creation_date timestamp,
    end_serial_number text,
    inventory_item_id int,
    last_update_date timestamp,
    resequence_count int,
    resequence_date timestamp,
    start_serial_number text,
    timestamp timestamp,
    PRIMARY KEY (tsd_key, tsd_timestamp, base_item_number, serial_id)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, base_item_number ASC, serial_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cnfwork (
    tsd_key bigint,
    tsd_timestamp timestamp,
    cnfwprodname text,
    cas_timestamp timestamp,
    cnfwbuildloc text,
    cnfwbuildnum int,
    cnfwcell text,
    cnfwchecksum text,
    cnfwcomments text,
    cnfwdesc text,
    cnfwdosfile text,
    cnfwdosvol int,
    cnfwfcksum int,
    cnfwfilesize int,
    cnfwfixedconf text,
    cnfwflashsize int,
    cnfwhassernum int,
    cnfwintmemsize int,
    cnfwlabeltype int,
    cnfwlevel int,
    cnfwnumdisks int,
    cnfwnvsize int,
    cnfwobstime timestamp,
    cnfwoptions int,
    cnfwpcmcia1 int,
    cnfwpcmcia2 int,
    cnfwprodarraya text,
    cnfwprodarrayb text,
    cnfwramsize int,
    cnfwrecord int,
    cnfwrectime timestamp,
    cnfwrev text,
    cnfwsharesize int,
    cnfwsoftconf text,
    cnfwsoftdldfile text,
    cnfwsoftrev text,
    cnfwswloc text,
    cnfwtimestamp timestamp,
    cnfwuuttype text,
    cnfwvar1 text,
    cnfwvar2 text,
    cnfwvar3 text,
    cnfwvar4 text,
    cnfwvar5 text,
    cnfwvarconf text,
    PRIMARY KEY (tsd_key, tsd_timestamp, cnfwprodname)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, cnfwprodname ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cnfspecials (
    tsd_key bigint,
    tsd_timestamp timestamp,
    top_lineid int,
    lineid int,
    atlinenum int,
    boot_image text,
    cas_timestamp timestamp,
    customer_id int,
    customer_name text,
    dispatch_date timestamp,
    fcd_date timestamp,
    image_name text,
    image_version text,
    isprod int,
    lastupdated_by text,
    lastupdated_on timestamp,
    level int,
    line_number int,
    linenum int,
    order_number int,
    ordered_quantity int,
    parent_lineid int,
    prod_name text,
    promise_date timestamp,
    qty int,
    rohs text,
    set_name text,
    PRIMARY KEY (tsd_key, tsd_timestamp, top_lineid, lineid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, top_lineid ASC, lineid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.system_items (
    item_number text,
    organization_id int,
    attribute1 text,
    attribute2 text,
    auto_created_config_flag text,
    basename text,
    bflush text,
    bom_enabled_flag text,
    bom_item_type int,
    build_in_wip_flag text,
    cas_timestamp timestamp,
    created_by int,
    creation_date timestamp,
    customer_order_enabled_flag text,
    customer_order_flag text,
    description text,
    enabled_flag text,
    groupnum int,
    inventory_item_id int,
    inventory_item_status_code text,
    item_type text,
    last_update_date timestamp,
    last_updated_by int,
    pick_components_flag text,
    planning_make_buy_code int,
    replenish_to_order_flag text,
    timestamp timestamp,
    tsd_timestamp timestamp,
    wip_supply_type int,
    PRIMARY KEY (item_number, organization_id)
) WITH CLUSTERING ORDER BY (organization_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.rohs_sn_ele_pid (
    pid text,
    sn_element_pid text,
    attribute1 text,
    attribute2 text,
    attribute3 text,
    cas_timestamp timestamp,
    creation_date timestamp,
    data_element_id int,
    last_update_date timestamp,
    quantity int,
    timestamp timestamp,
    tsd_timestamp timestamp,
    PRIMARY KEY (pid, sn_element_pid)
) WITH CLUSTERING ORDER BY (sn_element_pid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxml_prod (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    cas_timestamp timestamp,
    checkout text,
    comment text,
    copied_version int,
    deleted_from_prod boolean,
    deptid text,
    description text,
    extraid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    tsd_to_delete boolean,
    version int,
    xml text,
    xmlout text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cmpdit (
    grouprecnum int,
    fieldnum int,
    cas_timestamp timestamp,
    description text,
    function text,
    functionstatus int,
    optionnum3 int,
    optionstr1 text,
    optionstr2 text,
    prodname text,
    rectime timestamp,
    totfieldnum int,
    tsd_timestamp timestamp,
    type text,
    value text,
    PRIMARY KEY (grouprecnum, fieldnum)
) WITH CLUSTERING ORDER BY (fieldnum ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cnfexp (
    tsd_key bigint,
    tsd_timestamp timestamp,
    product_id text,
    cnfexp_key text,
    cas_timestamp timestamp,
    cnfexp_value text,
    id int,
    lastupdated_by text,
    lastupdated_on timestamp,
    PRIMARY KEY (tsd_key, tsd_timestamp, product_id, cnfexp_key)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, product_id ASC, cnfexp_key ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxml_common (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    cas_timestamp timestamp,
    checkout text,
    comment text,
    copied_version int,
    deleted_from_prod boolean,
    deptid text,
    description text,
    extraid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    tsd_to_delete boolean,
    version int,
    xml text,
    xmlout text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cnfv2 (
    tsd_key bigint,
    tsd_timestamp timestamp,
    top_lineid int,
    lineid int,
    atlinenum int,
    boot_image text,
    cas_timestamp timestamp,
    customer_id int,
    customer_name text,
    dispatch_date timestamp,
    fcd_date timestamp,
    image_name text,
    image_version text,
    lastupdated_by text,
    lastupdated_on timestamp,
    level int,
    line_number int,
    linenum int,
    ob_trans_id int,
    order_number int,
    ordered_quantity int,
    parent_lineid int,
    prod_name text,
    promise_date timestamp,
    qty int,
    rohs text,
    set_name text,
    PRIMARY KEY (tsd_key, tsd_timestamp, top_lineid, lineid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, top_lineid ASC, lineid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.subnets (
    subnet bigint PRIMARY KEY,
    cas_timestamp timestamp,
    description text,
    locationid int,
    netmask bigint,
    netmask_desc text,
    rectime timestamp,
    subnet_desc text,
    tsd_timestamp timestamp,
    usr text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.coo_rules_supplier_prefix (
    prefix text PRIMARY KEY,
    cas_timestamp timestamp,
    country text,
    rectime timestamp,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cnfspecials (
    top_lineid int,
    lineid int,
    atlinenum int,
    boot_image text,
    cas_timestamp timestamp,
    customer_id int,
    customer_name text,
    dispatch_date timestamp,
    fcd_date timestamp,
    image_name text,
    image_version text,
    isprod int,
    lastupdated_by text,
    lastupdated_on timestamp,
    level int,
    line_number int,
    linenum int,
    order_number int,
    ordered_quantity int,
    parent_lineid int,
    prod_name text,
    promise_date timestamp,
    qty int,
    rohs text,
    set_name text,
    tsd_timestamp timestamp,
    PRIMARY KEY (top_lineid, lineid)
) WITH CLUSTERING ORDER BY (lineid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.authorized_sites (
    application_name text,
    certificate_name text,
    site_id int,
    cas_timestamp timestamp,
    created_date timestamp,
    is_active boolean,
    organization_code text,
    organization_id int,
    site_code text,
    tsd_timestamp timestamp,
    updated_date timestamp,
    PRIMARY KEY (application_name, certificate_name, site_id)
) WITH CLUSTERING ORDER BY (certificate_name ASC, site_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.system_items_by_groupnum (
    groupnum int,
    item_number text,
    organization_id int,
    attribute1 text,
    attribute2 text,
    basename text,
    bflush text,
    inventory_item_id int,
    item_type text,
    PRIMARY KEY (groupnum, item_number, organization_id)
) WITH CLUSTERING ORDER BY (item_number ASC, organization_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmlhistory_prod (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    version int,
    cas_timestamp timestamp,
    comment text,
    deptid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    username text,
    xml text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid, version)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC, version ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_pidvid (
    tsd_key bigint,
    tsd_timestamp timestamp,
    pid text,
    tan text,
    vid text,
    base_pid text,
    base_tan text,
    cas_timestamp timestamp,
    created_by int,
    creation_date timestamp,
    last_updated_by int,
    last_updated_date timestamp,
    stat int,
    PRIMARY KEY (tsd_key, tsd_timestamp, pid, tan, vid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, pid ASC, tan ASC, vid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.copy_metadata_status (
    table_name text PRIMARY KEY,
    completed int,
    nb_error int,
    nb_rec int,
    nb_rec_per_sec int,
    start_time timestamp,
    timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.copy_metadata_load_history (
    dataset text,
    start_date timestamp,
    completed_date timestamp,
    data_from_date timestamp,
    data_to_date timestamp,
    hostname text,
    status text,
    username text,
    PRIMARY KEY (dataset, start_date)
) WITH CLUSTERING ORDER BY (start_date ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.sites_by_site_code (
    site_code text,
    site_id int,
    cas_timestamp timestamp,
    country_code text,
    daylight_savings text,
    dev1 text,
    location_type int,
    organization_code text,
    organization_id int,
    rectime timestamp,
    repair_sites text,
    serverid int,
    site_name text,
    siteid int,
    time_offset int,
    time_zone text,
    tsd_timestamp timestamp,
    username text,
    PRIMARY KEY (site_code, site_id)
) WITH CLUSTERING ORDER BY (site_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppsecureflag_common (
    tsd_key bigint,
    tsd_timestamp timestamp,
    machine text,
    cas_timestamp timestamp,
    flag int,
    site text,
    timestamp timestamp,
    tsd_to_delete boolean,
    PRIMARY KEY (tsd_key, tsd_timestamp, machine)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, machine ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmlhistory_dev (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    version int,
    cas_timestamp timestamp,
    comment text,
    deptid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    username text,
    xml text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid, version)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC, version ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.bomlite (
    product text,
    pn text,
    pn_parent text,
    belongtoglo int,
    bomlitesynonyms text,
    cas_timestamp timestamp,
    comp_qty int,
    disable_date timestamp,
    level int,
    prod_rev text,
    qty int,
    serial_flag text,
    synonym int,
    synonyms text,
    tan int,
    tsd_timestamp timestamp,
    update_date timestamp,
    PRIMARY KEY (product, pn, pn_parent)
) WITH CLUSTERING ORDER BY (pn ASC, pn_parent ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.swcnf_history (
    product_id text,
    lastupdated_on timestamp,
    boot_image text,
    cas_timestamp timestamp,
    cco_check text,
    cco_location text,
    config text,
    dos_name text,
    effective_date timestamp,
    end_date timestamp,
    flashchksum text,
    group_id int,
    id int,
    image_id int,
    image_name text,
    image_type text,
    imagesize bigint,
    initiated_version text,
    lastupdated_by text,
    md5 text,
    product_label text,
    tsd_timestamp timestamp,
    uuttype text,
    var1 text,
    var2 text,
    var3 text,
    var4 text,
    var5 text,
    version text,
    PRIMARY KEY (product_id, lastupdated_on)
) WITH CLUSTERING ORDER BY (lastupdated_on ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cmpd_by_prodname (
    prodname text,
    prodpartnum text,
    prodpartrev text,
    grouprecnum int,
    PRIMARY KEY (prodname, prodpartnum, prodpartrev, grouprecnum)
) WITH CLUSTERING ORDER BY (prodpartnum ASC, prodpartrev ASC, grouprecnum ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.swcnf_by_image_name (
    image_name text,
    product_id text,
    PRIMARY KEY (image_name, product_id)
) WITH CLUSTERING ORDER BY (product_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_goldboards_dev (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    sernum text,
    countername text,
    cas_timestamp timestamp,
    countervalue int,
    timestamp timestamp,
    tsd_to_delete boolean,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid, sernum, countername)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC, sernum ASC, countername ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.swcnf (
    product_id text PRIMARY KEY,
    boot_image text,
    cas_timestamp timestamp,
    cco_check text,
    cco_location text,
    config text,
    dos_name text,
    effective_date timestamp,
    end_date timestamp,
    flashchksum text,
    group_id int,
    id int,
    image_id int,
    image_name text,
    image_type text,
    imagesize bigint,
    initiated_version text,
    lastupdated_by text,
    lastupdated_on timestamp,
    md5 text,
    product_label text,
    tsd_timestamp timestamp,
    uuttype text,
    var1 text,
    var2 text,
    var3 text,
    var4 text,
    var5 text,
    version text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_bomlite (
    tsd_key bigint,
    tsd_timestamp timestamp,
    product text,
    pn text,
    pn_parent text,
    belongtoglo int,
    bomlitesynonyms text,
    cas_timestamp timestamp,
    comp_qty int,
    disable_date timestamp,
    level int,
    prod_rev text,
    qty int,
    serial_flag text,
    synonym int,
    synonyms text,
    tan int,
    update_date timestamp,
    PRIMARY KEY (tsd_key, tsd_timestamp, product, pn, pn_parent)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, product ASC, pn ASC, pn_parent ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_machines (
    tsd_key bigint,
    tsd_timestamp timestamp,
    machine text,
    cas_timestamp timestamp,
    country_code text,
    cppversion text,
    description text,
    family text,
    familyid int,
    hostid bigint,
    hwid int,
    ipaddr bigint,
    machineid int,
    osid int,
    rectime timestamp,
    replication_type text,
    site_id int,
    status text,
    username text,
    PRIMARY KEY (tsd_key, tsd_timestamp, machine)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, machine ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.areas (
    areaid int PRIMARY KEY,
    area text,
    areatype text,
    cas_timestamp timestamp,
    description text,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmldeleted_common (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    batchid text,
    cas_timestamp timestamp,
    checkout text,
    copied_version int,
    deleted_from_prod boolean,
    deletedby text,
    deptid text,
    description text,
    extraid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    rootobject boolean,
    tsd_to_delete boolean,
    version int,
    xml text,
    xmlout text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cnf (
    tsd_key bigint,
    tsd_timestamp timestamp,
    cnflineid int,
    cnfsubline1 int,
    cnfsubline2 int,
    cas_timestamp timestamp,
    cnfbuildnum int,
    cnfcustname text,
    cnfextra int,
    cnffcddate timestamp,
    cnffixedconf text,
    cnfflashsize int,
    cnfmachine text,
    cnfmajline int,
    cnfnumsystems int,
    cnfnvsize int,
    cnforgid int,
    cnfpcmcia1 int,
    cnfpcmcia2 int,
    cnfprodarraya text,
    cnfprodarrayb text,
    cnfprodname text,
    cnfpromdate timestamp,
    cnframsize int,
    cnfrectime timestamp,
    cnfsharesize int,
    cnfshipnum int,
    cnfsoftconf text,
    cnfsoftdldfile text,
    cnfsoftrev text,
    cnfsorder int,
    cnfswname text,
    cnftimestamp timestamp,
    cnfuuttype text,
    cnfvarconf text,
    PRIMARY KEY (tsd_key, tsd_timestamp, cnflineid, cnfsubline1, cnfsubline2)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, cnflineid ASC, cnfsubline1 ASC, cnfsubline2 ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.common_lookups (
    lookup_type text,
    lookup_code text,
    cas_timestamp timestamp,
    description text,
    is_enabled boolean,
    lookup_qualifier text,
    tsd_timestamp timestamp,
    PRIMARY KEY (lookup_type, lookup_code)
) WITH CLUSTERING ORDER BY (lookup_code ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.mrcs_by_pn (
    pn text,
    product text,
    id int,
    clei text,
    eci text,
    last_update_date timestamp,
    pn_parent text,
    PRIMARY KEY (pn, product, id)
) WITH CLUSTERING ORDER BY (product ASC, id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxml_dev (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    cas_timestamp timestamp,
    checkout text,
    comment text,
    copied_version int,
    deleted_from_prod boolean,
    deptid text,
    description text,
    extraid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    tsd_to_delete boolean,
    version int,
    xml text,
    xmlout text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmldeleted_prod (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    batchid text,
    cas_timestamp timestamp,
    checkout text,
    copied_version int,
    deleted_from_prod boolean,
    deletedby text,
    deptid text,
    description text,
    extraid text,
    machine text,
    objecttype text,
    parentid text,
    rectime timestamp,
    rootobject boolean,
    tsd_to_delete boolean,
    version int,
    xml text,
    xmlout text,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.sales_orders_by_top_model_line_id (
    top_model_line_id int,
    line_id int,
    PRIMARY KEY (top_model_line_id, line_id)
) WITH CLUSTERING ORDER BY (line_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_uuttypes (
    tsd_key bigint,
    tsd_timestamp timestamp,
    uutid int,
    cas_timestamp timestamp,
    description text,
    rectime timestamp,
    uuttype text,
    PRIMARY KEY (tsd_key, tsd_timestamp, uutid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, uutid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.coo_rules_bwh (
    pidname text,
    invcountry text,
    cas_timestamp timestamp,
    co text,
    rectime timestamp,
    tsd_timestamp timestamp,
    PRIMARY KEY (pidname, invcountry)
) WITH CLUSTERING ORDER BY (invcountry ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cppxmlrefid_dev (
    tsd_key bigint,
    tsd_timestamp timestamp,
    xmlid text,
    refid text,
    cas_timestamp timestamp,
    tsd_to_delete boolean,
    PRIMARY KEY (tsd_key, tsd_timestamp, xmlid, refid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, xmlid ASC, refid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 2592000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.sales_orders (
    line_id int PRIMARY KEY,
    ato_line_id int,
    bill_to_customer text,
    booked_date timestamp,
    business_entity text,
    cancel_flag text,
    cancel_line_date timestamp,
    cas_timestamp timestamp,
    coo_compliance text,
    created_by int,
    creation_date timestamp,
    cust_po_number text,
    dispatch_date timestamp,
    dispatch_result_code text,
    end_customer_address map<text, text>,
    end_customer_name text,
    fcd_date timestamp,
    fcd_recommit_date timestamp,
    header_id int,
    item_number text,
    item_type_code text,
    last_updated_by int,
    last_updated_date timestamp,
    line_number int,
    link_to_line_id int,
    ob_trans_id int,
    open_flag text,
    option_number int,
    order_number int,
    ordered_quantity int,
    production_date timestamp,
    production_result_code text,
    promise_date timestamp,
    rohs_flag text,
    set_name text,
    ship_from_org_id int,
    ship_set_id int,
    ship_to_address map<text, text>,
    ship_to_customer text,
    sold_to_org_id int,
    taa_flag text,
    top_model_line_id int,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.rohs_serial_numbers (
    base_item_number text,
    serial_id int,
    attribute_value text,
    cas_timestamp timestamp,
    creation_date timestamp,
    end_serial_number text,
    inventory_item_id int,
    last_update_date timestamp,
    resequence_count int,
    resequence_date timestamp,
    start_serial_number text,
    timestamp timestamp,
    tsd_timestamp timestamp,
    PRIMARY KEY (base_item_number, serial_id)
) WITH CLUSTERING ORDER BY (serial_id ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cnfv2 (
    top_lineid int,
    lineid int,
    atlinenum int,
    boot_image text,
    cas_timestamp timestamp,
    customer_id int,
    customer_name text,
    dispatch_date timestamp,
    fcd_date timestamp,
    image_name text,
    image_version text,
    lastupdated_by text,
    lastupdated_on timestamp,
    level int,
    line_number int,
    linenum int,
    ob_trans_id int,
    order_number int,
    ordered_quantity int,
    parent_lineid int,
    prod_name text,
    promise_date timestamp,
    qty int,
    rohs text,
    set_name text,
    tsd_timestamp timestamp,
    PRIMARY KEY (top_lineid, lineid)
) WITH CLUSTERING ORDER BY (lineid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 15552000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.cnfwork (
    cnfwprodname text PRIMARY KEY,
    cas_timestamp timestamp,
    cnfwbuildloc text,
    cnfwbuildnum int,
    cnfwcell text,
    cnfwchecksum text,
    cnfwcomments text,
    cnfwdesc text,
    cnfwdosfile text,
    cnfwdosvol int,
    cnfwfcksum int,
    cnfwfilesize int,
    cnfwfixedconf text,
    cnfwflashsize int,
    cnfwhassernum int,
    cnfwintmemsize int,
    cnfwlabeltype int,
    cnfwlevel int,
    cnfwnumdisks int,
    cnfwnvsize int,
    cnfwobstime timestamp,
    cnfwoptions int,
    cnfwpcmcia1 int,
    cnfwpcmcia2 int,
    cnfwprodarraya text,
    cnfwprodarrayb text,
    cnfwramsize int,
    cnfwrecord int,
    cnfwrectime timestamp,
    cnfwrev text,
    cnfwsharesize int,
    cnfwsoftconf text,
    cnfwsoftdldfile text,
    cnfwsoftrev text,
    cnfwswloc text,
    cnfwtimestamp timestamp,
    cnfwuuttype text,
    cnfwvar1 text,
    cnfwvar2 text,
    cnfwvar3 text,
    cnfwvar4 text,
    cnfwvar5 text,
    cnfwvarconf text,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.tsd_cmpd (
    tsd_key bigint,
    tsd_timestamp timestamp,
    prodpartnum text,
    prodpartrev text,
    grouprecnum int,
    additionalinfo text,
    cas_timestamp timestamp,
    description text,
    ecodevnum text,
    enddate timestamp,
    function text,
    functionstatus int,
    machine text,
    optionnum3 int,
    optionstr1 text,
    optionstr2 text,
    passwdfamily text,
    prodcodename text,
    prodname text,
    recordsharing text,
    recordstatus text,
    rectime timestamp,
    runitfamily text,
    startdate timestamp,
    testprocess text,
    testsite text,
    timestatus text,
    username text,
    PRIMARY KEY (tsd_key, tsd_timestamp, prodpartnum, prodpartrev, grouprecnum)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, prodpartnum ASC, prodpartrev ASC, grouprecnum ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 7776000
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE erp.product_template (
    item_number text,
    attribute_name text,
    cas_timestamp timestamp,
    created_date timestamp,
    default_value text,
    disable_date timestamp,
    effective_date timestamp,
    max_length int,
    min_length int,
    required_count int,
    tsd_timestamp timestamp,
    updated_date timestamp,
    validation_type text,
    validation_values text,
    PRIMARY KEY (item_number, attribute_name)
) WITH CLUSTERING ORDER BY (attribute_name ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';


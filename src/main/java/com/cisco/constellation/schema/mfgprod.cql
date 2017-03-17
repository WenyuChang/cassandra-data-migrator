^[[?1034h
CREATE KEYSPACE pq WITH replication = {'class': 'NetworkTopologyStrategy', 'Cassandra': '1'}  AND durable_writes = true;

CREATE TABLE mfgprod.tsd_serial_genealogy_errors_q (
    tsd_key bigint,
    tsd_timestamp timestamp,
    serial_number text,
    item_number text,
    cas_timestamp timestamp,
    error_message text,
    error_status text,
    record_time timestamp,
    PRIMARY KEY (tsd_key, tsd_timestamp, serial_number, item_number)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, serial_number ASC, item_number ASC)
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

CREATE TABLE mfgprod.tsd_test_results_by_bfstatus (
    tsd_key bigint,
    site_id int,
    tsd_timestamp timestamp,
    sernum text,
    rectime timestamp,
    area text,
    cas_timestamp timestamp,
    machine text,
    uuttype text,
    PRIMARY KEY (tsd_key, site_id, tsd_timestamp, sernum, rectime)
) WITH CLUSTERING ORDER BY (site_id ASC, tsd_timestamp ASC, sernum ASC, rectime ASC)
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

CREATE TABLE mfgprod.test_results (
    sernum text,
    rectime timestamp,
    area text,
    attributes text,
    bfstatus text,
    cas_timestamp timestamp,
    machine text,
    mode text,
    parentsernum text,
    passfail text,
    site_id int,
    source text,
    tsd_timestamp timestamp,
    tst_id timestamp,
    uuttype text,
    PRIMARY KEY (sernum, rectime)
) WITH CLUSTERING ORDER BY (rectime DESC)
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

CREATE TABLE mfgprod.test_results_by_lineid (
    lineid int,
    sernum text,
    rectime timestamp,
    PRIMARY KEY (lineid, sernum, rectime)
) WITH CLUSTERING ORDER BY (sernum ASC, rectime ASC)
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

CREATE TABLE mfgprod.serial_numbers_events (
    serial_number text,
    item_number text,
    event_type int,
    event_timestamp timestamp,
    cas_timestamp timestamp,
    derived_attributes text,
    event_status text,
    mfg_attributes text,
    ship_attributes text,
    tsd_timestamp timestamp,
    validation_message text,
    PRIMARY KEY (serial_number, item_number, event_type, event_timestamp)
) WITH CLUSTERING ORDER BY (item_number ASC, event_type ASC, event_timestamp ASC)
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

CREATE TABLE mfgprod.tsd_serial_genealogy (
    tsd_key bigint,
    tsd_timestamp timestamp,
    serial_number text,
    item_number text,
    cas_timestamp timestamp,
    level int,
    parent_item_number text,
    parent_serial_number text,
    record_time timestamp,
    site_id int,
    sort_order text,
    top_model_item_number text,
    top_model_serial_number text,
    PRIMARY KEY (tsd_key, tsd_timestamp, serial_number, item_number)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, serial_number ASC, item_number ASC)
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

CREATE TABLE mfgprod.mac_oui (
    oui bigint,
    eadr bigint,
    sadr bigint,
    area text,
    assigntime timestamp,
    cas_timestamp timestamp,
    comments text,
    fname text,
    logfname text,
    logline int,
    machine text,
    qty int,
    rectime timestamp,
    req text,
    seq int,
    tsd_timestamp timestamp,
    PRIMARY KEY (oui, eadr, sadr)
) WITH CLUSTERING ORDER BY (eadr ASC, sadr ASC)
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

CREATE TABLE mfgprod.test_results_copy_status (
    thread_id int PRIMARY KEY,
    completed int,
    nb_rec_per_sec int,
    timestamp timestamp,
    total_rec bigint,
    tst_id bigint
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

CREATE TABLE mfgprod.tsd_test_results (
    tsd_key bigint,
    tsd_timestamp timestamp,
    sernum text,
    rectime timestamp,
    area text,
    attributes text,
    bfstatus text,
    cas_timestamp timestamp,
    machine text,
    mode text,
    parentsernum text,
    passfail text,
    site_id int,
    source text,
    tst_id timestamp,
    uuttype text,
    PRIMARY KEY (tsd_key, tsd_timestamp, sernum, rectime)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, sernum ASC, rectime ASC)
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

CREATE TABLE mfgprod.serial_genealogy_events (
    serial_number text,
    item_number text,
    event_timestamp timestamp,
    bom_structure text,
    cas_timestamp timestamp,
    record_time timestamp,
    source int,
    tsd_timestamp timestamp,
    validation_message text,
    PRIMARY KEY (serial_number, item_number, event_timestamp)
) WITH CLUSTERING ORDER BY (item_number ASC, event_timestamp ASC)
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

CREATE TABLE mfgprod.mac_bindings_by_serial_number (
    serial_number text,
    record_time timestamp,
    mac_end_addr bigint,
    mac_start_addr bigint,
    area text,
    block_size bigint,
    error_code text,
    machine text,
    request text,
    timestamp timestamp,
    uuttype text,
    PRIMARY KEY (serial_number, record_time, mac_end_addr, mac_start_addr)
) WITH CLUSTERING ORDER BY (record_time DESC, mac_end_addr ASC, mac_start_addr ASC)
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

CREATE TABLE mfgprod.mac_bindings (
    partition_key bigint,
    mac_end_addr bigint,
    mac_start_addr bigint,
    serial_number text,
    record_time timestamp,
    area text,
    block_size bigint,
    cas_timestamp timestamp,
    error_code text,
    machine text,
    request text,
    timestamp timestamp,
    tsd_timestamp timestamp,
    uuttype text,
    PRIMARY KEY (partition_key, mac_end_addr, mac_start_addr, serial_number, record_time)
) WITH CLUSTERING ORDER BY (mac_end_addr ASC, mac_start_addr ASC, serial_number ASC, record_time ASC)
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

CREATE TABLE mfgprod.tsd_mac_bindings (
    tsd_key bigint,
    tsd_timestamp timestamp,
    partition_key bigint,
    mac_end_addr bigint,
    mac_start_addr bigint,
    serial_number text,
    record_time timestamp,
    area text,
    block_size bigint,
    cas_timestamp timestamp,
    error_code text,
    machine text,
    request text,
    timestamp timestamp,
    uuttype text,
    PRIMARY KEY (tsd_key, tsd_timestamp, partition_key, mac_end_addr, mac_start_addr, serial_number, record_time)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, partition_key ASC, mac_end_addr ASC, mac_start_addr ASC, serial_number ASC, record_time ASC)
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

CREATE TABLE mfgprod.test_events (
    event_type int,
    event_key text,
    event_time timestamp,
    name text,
    cas_timestamp timestamp,
    tsd_timestamp timestamp,
    value text,
    PRIMARY KEY ((event_type, event_key), event_time, name)
) WITH CLUSTERING ORDER BY (event_time DESC, name ASC)
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

CREATE TABLE mfgprod.mac_errors_q (
    partition_key bigint,
    mac_end_addr bigint,
    mac_start_addr bigint,
    serial_number text,
    record_time timestamp,
    area text,
    block_size bigint,
    cas_timestamp timestamp,
    error_code text,
    machine text,
    request text,
    timestamp timestamp,
    tsd_timestamp timestamp,
    uuttype text,
    PRIMARY KEY (partition_key, mac_end_addr, mac_start_addr, serial_number, record_time)
) WITH CLUSTERING ORDER BY (mac_end_addr ASC, mac_start_addr ASC, serial_number ASC, record_time ASC)
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

CREATE TABLE mfgprod.tsd_mac_oui (
    tsd_key bigint,
    tsd_timestamp timestamp,
    oui bigint,
    eadr bigint,
    sadr bigint,
    area text,
    assigntime timestamp,
    cas_timestamp timestamp,
    comments text,
    fname text,
    logfname text,
    logline int,
    machine text,
    qty int,
    rectime timestamp,
    req text,
    seq int,
    PRIMARY KEY (tsd_key, tsd_timestamp, oui, eadr, sadr)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, oui ASC, eadr ASC, sadr ASC)
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

CREATE TABLE mfgprod.pgr_requests (
    serial_number text,
    item_number text,
    pgr_timestamp timestamp,
    action text,
    area text,
    cas_timestamp timestamp,
    machine text,
    parent_item_number text,
    parent_serial_number text,
    site_id int,
    tsd_timestamp timestamp,
    PRIMARY KEY (serial_number, item_number, pgr_timestamp)
) WITH CLUSTERING ORDER BY (item_number ASC, pgr_timestamp DESC)
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

CREATE TABLE mfgprod.serial_numbers (
    serial_number text,
    item_number text,
    cas_timestamp timestamp,
    derived_attributes text,
    line_id bigint,
    mfg_attributes text,
    par_timestamp timestamp,
    rts_status text,
    ship_attributes text,
    ship_status text,
    ship_timestamp timestamp,
    site_id int,
    test_timestamp timestamp,
    tsd_timestamp timestamp,
    validation_message text,
    PRIMARY KEY (serial_number, item_number)
) WITH CLUSTERING ORDER BY (item_number ASC)
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

CREATE TABLE mfgprod.dataset_timestamp_logs (
    dataset_name text,
    element_name text,
    element_value text,
    last_timestamp timestamp,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (dataset_name, element_name, element_value)
) WITH CLUSTERING ORDER BY (element_name ASC, element_value ASC)
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

CREATE TABLE mfgprod.serial_genealogy_by_top_model_serial_number (
    top_model_serial_number text,
    top_model_item_number text,
    sort_order text,
    item_number text,
    level int,
    parent_item_number text,
    parent_serial_number text,
    record_time timestamp,
    serial_number text,
    PRIMARY KEY (top_model_serial_number, top_model_item_number, sort_order)
) WITH CLUSTERING ORDER BY (top_model_item_number ASC, sort_order ASC)
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

CREATE TABLE mfgprod.serial_genealogy (
    serial_number text,
    item_number text,
    cas_timestamp timestamp,
    level int,
    parent_item_number text,
    parent_serial_number text,
    record_time timestamp,
    site_id int,
    sort_order text,
    top_model_item_number text,
    top_model_serial_number text,
    tsd_timestamp timestamp,
    PRIMARY KEY (serial_number, item_number)
) WITH CLUSTERING ORDER BY (item_number ASC)
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

CREATE TABLE mfgprod.tsd_serial_genealogy_events (
    tsd_key bigint,
    tsd_timestamp timestamp,
    serial_number text,
    item_number text,
    cas_timestamp timestamp,
    record_time timestamp,
    PRIMARY KEY (tsd_key, tsd_timestamp, serial_number, item_number)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, serial_number ASC, item_number ASC)
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

CREATE TABLE mfgprod.par_requests (
    serial_number text,
    par_timestamp timestamp,
    item_number text,
    cas_timestamp timestamp,
    mfg_attributes text,
    site_id int,
    site_type text,
    tracking_id text,
    tsd_timestamp timestamp,
    PRIMARY KEY (serial_number, par_timestamp, item_number)
) WITH CLUSTERING ORDER BY (par_timestamp ASC, item_number ASC)
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

CREATE TABLE mfgprod.test_results_by_parentsernum (
    parentsernum text,
    sernum text,
    area text,
    rectime timestamp,
    PRIMARY KEY (parentsernum, sernum)
) WITH CLUSTERING ORDER BY (sernum ASC)
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

CREATE TABLE mfgprod.tsd_serial_numbers (
    tsd_key bigint,
    tsd_timestamp timestamp,
    serial_number text,
    item_number text,
    cas_timestamp timestamp,
    derived_attributes text,
    line_id bigint,
    mfg_attributes text,
    par_timestamp timestamp,
    rts_status text,
    ship_attributes text,
    ship_status text,
    ship_timestamp timestamp,
    site_id int,
    test_timestamp timestamp,
    validation_message text,
    PRIMARY KEY (tsd_key, tsd_timestamp, serial_number, item_number)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, serial_number ASC, item_number ASC)
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

CREATE TABLE mfgprod.pgr_requests_by_parent_serial_number (
    parent_serial_number text,
    parent_item_number text,
    serial_number text,
    item_number text,
    pgr_timestamp timestamp,
    PRIMARY KEY (parent_serial_number, parent_item_number, serial_number, item_number)
) WITH CLUSTERING ORDER BY (parent_item_number ASC, serial_number ASC, item_number ASC)
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


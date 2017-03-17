^[[?1034h
CREATE KEYSPACE pq WITH replication = {'class': 'NetworkTopologyStrategy', 'Cassandra': '1'}  AND durable_writes = true;

CREATE TABLE mfgmeas.tsd_test_steps (
    tsd_key bigint,
    tsd_timestamp timestamp,
    sernum text,
    uuttype text,
    area text,
    tst_id timestamp,
    rectime timestamp,
    uniq_id int,
    attributes text,
    cas_timestamp timestamp,
    endtime timestamp,
    machine text,
    passfail text,
    starttime timestamp,
    step_id text,
    PRIMARY KEY (tsd_key, tsd_timestamp, sernum, uuttype, area, tst_id, rectime, uniq_id)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, sernum ASC, uuttype ASC, area ASC, tst_id ASC, rectime ASC, uniq_id ASC)
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

CREATE TABLE mfgmeas.tsd_binary_measures (
    tsd_key bigint,
    tsd_timestamp timestamp,
    guid text,
    cas_timestamp timestamp,
    data blob,
    filename text,
    state text,
    PRIMARY KEY (tsd_key, tsd_timestamp, guid)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, guid ASC)
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

CREATE TABLE mfgmeas.tsd_test_measures (
    tsd_key bigint,
    tsd_timestamp timestamp,
    sernum text,
    uuttype text,
    area text,
    tst_id timestamp,
    rectime timestamp,
    uniq_id int,
    attributes text,
    cas_timestamp timestamp,
    limit_id text,
    machine text,
    meastime timestamp,
    name text,
    params text,
    passfail text,
    step_id text,
    type text,
    value text,
    PRIMARY KEY (tsd_key, tsd_timestamp, sernum, uuttype, area, tst_id, rectime, uniq_id)
) WITH CLUSTERING ORDER BY (tsd_timestamp ASC, sernum ASC, uuttype ASC, area ASC, tst_id ASC, rectime ASC, uniq_id ASC)
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

CREATE TABLE mfgmeas.test_steps (
    sernum text,
    uuttype text,
    area text,
    tst_id timestamp,
    rectime timestamp,
    uniq_id int,
    attributes text,
    cas_timestamp timestamp,
    endtime timestamp,
    machine text,
    passfail text,
    starttime timestamp,
    step_id text,
    tsd_timestamp timestamp,
    PRIMARY KEY ((sernum, uuttype, area), tst_id, rectime, uniq_id)
) WITH CLUSTERING ORDER BY (tst_id ASC, rectime ASC, uniq_id ASC)
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

CREATE TABLE mfgmeas.binary_measures (
    guid text PRIMARY KEY,
    cas_timestamp timestamp,
    data blob,
    filename text,
    state text,
    tsd_timestamp timestamp
) WITH bloom_filter_fp_chance = 0.01
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

CREATE TABLE mfgmeas.test_measures (
    sernum text,
    uuttype text,
    area text,
    tst_id timestamp,
    rectime timestamp,
    uniq_id int,
    attributes text,
    cas_timestamp timestamp,
    limit_id text,
    machine text,
    meastime timestamp,
    name text,
    params text,
    passfail text,
    step_id text,
    tsd_timestamp timestamp,
    type text,
    value text,
    PRIMARY KEY ((sernum, uuttype, area), tst_id, rectime, uniq_id)
) WITH CLUSTERING ORDER BY (tst_id ASC, rectime ASC, uniq_id ASC)
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


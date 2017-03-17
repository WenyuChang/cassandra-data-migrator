CREATE KEYSPACE pq WITH replication = {'class': 'NetworkTopologyStrategy', 'Cassandra': '1'}  AND durable_writes = true;

CREATE TABLE mfgcache.aaa_tokens (
    aaa_token text,
    token_type text,
    app_id text,
    authcode text,
    created_timestamp timestamp,
    expiry_timestamp timestamp,
    refresh_token text,
    scopes text,
    server_name text,
    PRIMARY KEY (aaa_token, token_type)
) WITH CLUSTERING ORDER BY (token_type ASC)
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

CREATE TABLE mfgcache.aaa_authcode_tokens (
    authcode text PRIMARY KEY,
    aaa_token text,
    ac_app_id text,
    ac_created_timestamp timestamp,
    ac_credential_type text,
    ac_expiry_timestamp timestamp,
    ac_redirect_url text,
    ac_requestor_id text,
    ac_response_type text,
    ac_scope text,
    ac_server_name text,
    ac_state text,
    refresh_token text,
    rt_expiry_timestamp timestamp,
    tk_app_id text,
    tk_created_timestamp timestamp,
    tk_expiry_timestamp timestamp,
    tk_server_name text,
    token_type text
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

CREATE TABLE mfgcache.aaa_authcodes (
    authcode text PRIMARY KEY,
    active int,
    app_id text,
    created_timestamp timestamp,
    credential_type text,
    expiry_timestamp timestamp,
    redirect_url text,
    requestor_id text,
    response_type text,
    scope text,
    server_name text,
    state text,
    update_timestamp timestamp
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

CREATE TABLE mfgcache.flex_license_mappings (
    product_sku text,
    feature_name text,
    expiry_days bigint,
    feature_id bigint,
    feature_type text,
    feature_version text,
    mapping_count bigint,
    product_family text,
    sku_id bigint,
    updated_date timestamp,
    PRIMARY KEY (product_sku, feature_name)
) WITH CLUSTERING ORDER BY (feature_name ASC)
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

CREATE TABLE mfgcache.aaa_state_cache (
    ac_state timeuuid PRIMARY KEY,
    ac_app_id text,
    ac_credential_type text,
    ac_redirect_url text,
    ac_requestor_id text,
    ac_response_type text,
    ac_server_name text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = '{"keys":"ALL", "rows_per_partition":"NONE"}'
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'}
    AND compression = {'sstable_compression': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 3600
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99.0PERCENTILE';

CREATE TABLE mfgcache.asarules (
    rulenew text,
    license text,
    upgrade text,
    platform text,
    scenario text,
    action text,
    mkkey text,
    rectime timestamp,
    ruletype text,
    PRIMARY KEY (rulenew, license, upgrade, platform, scenario, action)
) WITH CLUSTERING ORDER BY (license ASC, upgrade ASC, platform ASC, scenario ASC, action ASC)
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

CREATE TABLE mfgcache.mfglicense (
    sernum text,
    tstrectime timestamp,
    key text,
    lic text,
    lineid int,
    machine text,
    mkop text,
    rectime timestamp,
    requesting_system text,
    srv text,
    status text,
    txn_id text,
    type text,
    user_name text,
    uuttype text,
    PRIMARY KEY (sernum, tstrectime)
) WITH CLUSTERING ORDER BY (tstrectime ASC)
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

CREATE TABLE mfgcache.flex_license_bindings (
    serial_number text,
    txn_id text,
    txn_type text,
    product_sku_feature text,
    creation_date timestamp,
    dla_type text,
    dlr text,
    feature_line_id bigint,
    feature_line_number bigint,
    generate_machine text,
    license_count bigint,
    license_key text,
    location bigint,
    order_line_id bigint,
    order_line_number bigint,
    order_number bigint,
    pak text,
    product_description text,
    product_family text,
    request_machine text,
    requesting_system text,
    sku_quantity bigint,
    txn_status bigint,
    user_name text,
    PRIMARY KEY (serial_number, txn_id, txn_type, product_sku_feature)
) WITH CLUSTERING ORDER BY (txn_id ASC, txn_type ASC, product_sku_feature ASC)
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

CREATE TABLE mfgcache.product_security_log (
    serial_number text,
    application_type text,
    site_code text,
    machine text,
    request_timestamp timestamp,
    request_attributes text,
    response_attributes text,
    PRIMARY KEY (serial_number, application_type, site_code, machine, request_timestamp)
) WITH CLUSTERING ORDER BY (application_type ASC, site_code ASC, machine ASC, request_timestamp ASC)
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


{application, couch, [
    {description, "Apache CouchDB"},
    {vsn, "1.7.1"},
    {modules, []},
    {registered, [
        couch_config,
        couch_db_update,
        couch_db_update_notifier_sup,
        couch_external_manager,
        couch_httpd,
        couch_log,
        couch_primary_services,
        couch_query_servers,
        couch_secondary_services,
        couch_server,
        couch_server_sup,
        couch_stats_aggregator,
        couch_stats_collector,
        couch_task_status
    ]},
    {mod, {couch_app, [
        "/System/Volumes/Data/SWE/Apps/DT/BuildRoots/BuildRoot7/ActiveBuildRoot/Library/Caches/com.apple.xbs/Sources/XCSCouchDB/XCSCouchDB-21.0.4/build/etc/couchdb/default.ini",
        "/System/Volumes/Data/SWE/Apps/DT/BuildRoots/BuildRoot7/ActiveBuildRoot/Library/Caches/com.apple.xbs/Sources/XCSCouchDB/XCSCouchDB-21.0.4/build/etc/couchdb/local.ini"
    ]}},
    {applications, [kernel, stdlib]},
    {included_applications, [crypto, sasl, inets, oauth, ibrowse, mochiweb, os_mon]}
]}.

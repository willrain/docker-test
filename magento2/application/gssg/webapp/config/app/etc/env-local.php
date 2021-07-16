<?php
return array (
    'backend' => array ('frontName' => 'admin',),
    'db' => array (
        'connection' => array (
            'indexer' => array (
                'host' => '10.203.7.198',
                'dbname' => 'ngssgdb',
                'username' => 'gssg',
                'password' => 'gssg12#',
                'active' => '1',
                'persistent' => NULL,
            ),
            'default' => array (
                'host' => '10.203.7.198',
                'dbname' => 'ngssgdb',
                'username' => 'gssg',
                'password' => 'gssg12#',
                'active' => '1',
            ),
        ),
        'table_prefix' => '',
    ),
    'crypt' => array ( 'key' => '7421f46f6afc6fbc47498c265a579806',),
    'resource' => array (
        'default_setup' => array (
            'connection' => 'default',
        ),
    ),
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'developer',
    'cache_types' => array (
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'eav' => 1,
        'full_page' => 1,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'target_rule' => 1,
        'translate' => 1,
        'config_webservice' => 1,
    ),
    'cache' => array(
        'frontend' => array(
            'default' => array(
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => array(
                    'server' => 'magento2-gssg-redis',
                    'port' => '6379',
                    'persistent' => '',
                    'database' => '1',
                    'force_standalone' => '0',
                    'connect_retries' => '1',
                    'read_timeout' => '10',
                    'automatic_cleaning_factor' => '0',
                    'compress_data' => '1',
                    'compress_tags' => '1',
                    'compress_threshold' => '20480',
                    'compression_lib' => 'gzip',
                ),
            ),
            'page_cache' => array(
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => array(
                    'server' => 'magento2-gssg-redis',
                    'port' => '6379',
                    'persistent' => '',
                    'database' => '3',
                    'force_standalone' => '0',
                    'connect_retries' => '1',
                    'read_timeout' => '10',
                    'automatic_cleaning_factor' => '0',
                    'compress_data' => '0',
                    'compress_tags' => '1',
                    'compress_threshold' => '20480',
                    'compression_lib' => 'gzip',
                )
            )
        )
    ),
    'session' => array (
        'save' => 'redis',
        'redis' => array (
            'host' => 'magento2-gssg-redis',
            'port' => '6379',
            'password' => '',
            'timeout' => '2.5',
            'persistent_identifier' => '',
            'database' => '10',
            'compress_data' => '0',
            'compression_threshold' => '2048',
            'compression_library' => 'gzip',
            'log_level' => '1',
            'max_concurrency' => '6',
            'break_after_frontend' => '5',
            'break_after_adminhtml' => '30',
            'first_lifetime' => '600',
            'bot_first_lifetime' => '60',
            'bot_lifetime' => '7200',
            'disable_locking' => '0',
            'min_lifetime' => '60',
            'max_lifetime' => '2592000'
        )
    ),
    'install' => array ( 'date' => 'Tue, 31 May 2016 04:10:02 +0000',),
    'zone' => 'local',
    'mage_root_dir' => '/data01/webroot/www',
);

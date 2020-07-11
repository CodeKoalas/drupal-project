<?php

$settings['update_free_access'] = FALSE;
$settings['file_private_path'] = '../private';
$settings['container_yamls'][] = $app_root . '/' . $site_path . '/services.yml';
$settings['file_scan_ignore_directories'] = [
  'node_modules',
  'bower_components',
];
$settings['entity_update_batch_size'] = 50;
$settings['hash_salt'] = 'asotenuarchqewsmaoeuSNTH56654+';
$settings['trusted_host_patterns'] = [
  getenv('DRUPAL_TRUSTED_HOSTS')
];

$databases = [];
$databases['default']['default'] = [
  'database' => getenv('DATABASE_NAME'),
  'username' => getenv('DATABASE_USERNAME'),
  'password' => getenv('DATABASE_PASSWORD'),
  'prefix' => '',
  'host' => getenv('DATABASE_HOST'),
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
];

$config_directories = [];
$config_directories[CONFIG_SYNC_DIRECTORY] = '../config/default/default';

$site_environment = getenv('SITE_ENV');
$config['config_split.config_split.local']['status'] = FALSE;
$config['config_split.config_split.dev']['status'] = FALSE;
$config['config_split.config_split.stage']['status'] = FALSE;
$config['config_split.config_split.prod']['status'] = FALSE;

switch ($site_environment) {
  case 'local':
    $config['config_split.config_split.local']['status'] = TRUE;
    break;
  case 'dev':
    $config['config_split.config_split.dev']['status'] = TRUE;
    break;
  case 'stage':
    $config['config_split.config_split.stage']['status'] = TRUE;
    break;
  case 'prod':
    $config['config_split.config_split.prod']['status'] = TRUE;
    break;
}

/**
 * Include a custom settings file if it exists.
 */
$custom_settings = DRUPAL_ROOT . '/sites/default/custom.settings.php';
if (file_exists($custom_settings)) {
  include $custom_settings;
}


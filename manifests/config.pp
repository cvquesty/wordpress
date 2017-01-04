# Main config manifest for the Wordpress module.  Configures and places
# wp-config.php as needed.
#
# === Parameters
# [*wpversion*]       Version of Wordpress to extract
# [*sysdocroot*]      Destination Document Root for Wordpress
# [*db_name*]         Name of MySQL Database to use
# [*db_user*]         DB User to use as Admin on this site
# [*db_password*]     DB User Password to use
# [*db_host*]         Node on which the database resides
# [*wp_table_prefix*] Prefix, if any, you want prepended to table
# [*wp_debug*]        Whether to place Wordpress into debug mode
#
class wordpress::config (

  $wpversion       = $::wordpress::params::version,
  $sysdocroot      = $::wordpress::params::docroot,
  $db_name         = $::wordpress::params::dbname,
  $db_user         = $::wordpress::params::dbuser,
  $db_password     = $::wordpress::params::dbpass,
  $db_host         = $::wordpress::params::dbhost,
  $wp_table_prefix = $::wordpress::params::tablpre,
  $wp_debug        = $::wordpress::params::wpdebug

) inherits wordpress::params {

  file { "/var/www/html/${sysdocroot}/wp-config.php":
    ensure  => 'present',
    owner   => 'apache',
    group   => 'apache',
    mode    => '0644',
    content => template('wordpress/wp-config_template.erb'),
  }

}

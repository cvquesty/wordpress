# Main Manifest to add the MySQL DB associated with this WordPress instance
#
# === Parameters
# [*wpversion*]       Version of Wordpress to extract
# [*sysdocroot*]      Destination Document Root for Wordpress
# [*db_name*]         Name of MySQL Database to use
# [*db_user*]         DB User to use as Admin on this site
# [*db_password*]     DB User Password to use
# [*db_host*]         Node on which the database resides
# [*wp_table_prefix*] Prefix, if any, you want prepended to table
#
class wordpress::db (

  $wpversion       = $::wordpress::params::version,
  $sysdocroot      = $::wordpress::params::docroot,
  $db_name         = $::wordpress::params::dbname,
  $db_user         = $::wordpress::params::dbuser,
  $db_password     = $::wordpress::params::dbpass,
  $db_host         = $::wordpress::params::dbhost,
  $wp_table_prefix = $::wordpress::params::tablepre,

) inherits wordpress::params {

  # Add Database
  mysql_database { "${db_host}/${db_name}":
    name    => $db_name,
    charset => 'utf8',
  }

  # Create DB User
  mysql_user { "${db_user}@${db_host}":
    password_hash => mysql_password($db_password),
  }

  # Grant User Permissions
  mysql_grant { "${db_user}@${db_host}/${db_name}.*":
    table      => "${db_name}.*",
    user       => "${db_user}@${db_host}",
    privileges => ['ALL'],
  }

}

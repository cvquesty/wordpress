# Main config manifest for the Wordpress module.  Configures and places
# wp-config.php as needed.
#
# === Parameters
# [*wpversion*] Version of Wordpress to extract
# [*sysdocroot*] Destination Document Root for Wordpress
#
class wordpress::config (

  $wpversion  = $::wordpress::params::version,
  $sysdocroot = $::wordpress::params::docroot,

) inherits wordpress::params {



}

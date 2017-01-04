# Class: wordpress
# ===========================
#
# Module to install Wordpress, create a Database, and complete initial
# Configuration to automate creation of Wordpress sites.
#
# === Parameters
#
# [*wpversion*] The version of Wordpress you wish to install
# [*sysdocroot*] The destination docroot *inside* of Apache's default destination
#   - (in this case /var/www/html) to extract the Wordpress tarball
#
#
#
class wordpress (

  $wpversion  = $::wordpress::params::version,
  $sysdocroot = $::wordpress::params::docroot,

) inherits wordpress::params {

  # Fetch the Wordpress Archive
  wordpress::fetch { $name:
    version => $wpversion,
    docroot => $sysdocroot,
  }

  # Extract the Wordpress Archive
  wordpress::extract { $name:
    version => $wpversion,
    docroot => $sysdocroot,
  }

  # Add Wordpress Configuration
  include [ '::wordpress::config' ]

}

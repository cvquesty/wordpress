# Class: wordpress
# ===========================
#
# Module to install Wordpress, create a Database, and complete initial
# Configuration to automate creation of Wordpress sites.
#
# === Parameters
#
# [*version*] The version of Wordpress you wish to install
# [*docroot*] The destination docroot *inside* of Apache's default destination
#   - (in this case /var/www/html) to extract the Wordpress tarball
#
#
#
class wordpress {

  $version = $::wordpress::params::version
  $docroot = $::wordpress::params::docroot

  wordpress::fetch { $name:
    version => $version,
  }

  wordpress::extract { $name:
    version => $version,
    docroot => $docroot,
    require => Exec[ 'extractit' ],
  }

}

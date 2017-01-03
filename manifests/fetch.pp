# Defined type to download proper Wordpress Archive
#
# === Parameters:
#
# [*version*] Version number of Wordpress to download
#
define wordpress::fetch (
  $version,
) {

  # Check that the archive actually exists
  exec { 'isitthere':
    onlyif  => "/usr/bin/wget --spider https://wordpress.org/wordpress-${version}.tar.gz",
    command => "/usr/bin/wget https://wordpress.org/wordpress-${version}.tar.gz -P /var/tmp/wordpress-${version}.tar.gz",
  }

}

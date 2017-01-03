# Defined type to download proper Wordpress Archive
#
# === Parameters:
#
# [*version*] Version number of Wordpress to download
# [*site*] Directory under /var/www/html to place retrieved archive
# -- usually corresponds to "servername" directive from Vhost entry
#
define wordpress::fetch (
  Number $version,
  String $site,
) {

  # Check that the archive actually exists
  exec { 'isitthere':
    onlyif  => "/usr/bin/wget --spider https://wordpress.org/wordpress-${version}.tar.gz",
    command => "/usr/bin/wget https://wordpress.org/wordpress-${version}.tar.gz -P /var/www/html/${site}/wordpress-${version}.tar.gz",
  }

}

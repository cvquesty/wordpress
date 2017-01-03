# Manifest to extract wordpress tarball from /var/tmp to
# required vhost docroot
#
# === Parameters:
#
# [*version*] Version of Wordpress to extract
# [*docroot*] Destination Document Root for Wordpress
define wordpress::extract (
  $version,
  $docroot,
) {

  exec { 'extractit':
    onlyif  => "/bin/test -f /var/tmp/wordpress-${version}.tar.gz",
    command => "/usr/bin/tar -zxvf /var/tmp/wordpress-${version}.tar.gz --strip 1 -C /var/www/html/${docroot}",
  }
}

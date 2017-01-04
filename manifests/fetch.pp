# Defined type to download proper Wordpress Archive
#
# === Parameters:
#
# [*version*] Version number of Wordpress to download
# [*docroot*] Destination Document Root for Wordpress
#
define wordpress::fetch (
  $version,
  $docroot,
) {

  # Check that the archive actually exists
  exec { 'getit':
    unless  => "/bin/test -f /var/www/html/${docroot}/wp-comments-post.php",
    command => "/usr/bin/wget https://wordpress.org/wordpress-${version}.tar.gz -P /var/tmp",
    before  => Exec[ 'extractit' ],
  }

}

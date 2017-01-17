# Main Parameters file for the Wordpress module
#
class wordpress::params {

  # Wordpress parameters
  $version = '4.7'
  $docroot = 'questy.org'
  $dbname  = 'questy_org'
  $dbuser  = 'admin'
  $dbpass  = 'bassline'
  $dbhost  = 'localhost'
  $tablpre = 'wp_'
  $wpdebug = false

}

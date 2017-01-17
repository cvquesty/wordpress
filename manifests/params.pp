# Main Parameters file for the Wordpress module
#
class wordpress::params {

  # Wordpress parameters
  $version = ''
  $docroot = ''
  $dbname  = ''
  $dbuser  = ''
  $dbpass  = 'e'
  $dbhost  = ''
  $tablpre = 'wp_'
  $wpdebug = false

}

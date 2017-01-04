# Main Parameters file for the Wordpress module
#
class wordpress::params {

  # Wordpress parameters
  $version = '4.7'
  $docroot = 'questy.org'
  $dbname  = 'questy_org'
  $dbuser  = 'questyadmin'
  $dbpass  = 'B@sslin3'
  $dbhost  = 'localhost'
  $tablpre = 'wp_'

}

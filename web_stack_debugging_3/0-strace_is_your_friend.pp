# Fixes Apache 500 error caused by typo in WordPress file
# The issue is typically a .phpp extension instead of .php

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/',
  onlyif  => 'grep -q phpp /var/www/html/wp-settings.php',
}

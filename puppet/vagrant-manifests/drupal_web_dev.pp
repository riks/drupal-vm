/*class { "iptables": }

class { "apache": }
apache::vhost { 'localhost':
  docroot  => '/vagrant/www/localhost/public_html',
}
apache::vhost { 'phpinfo':
  docroot  => '/vagrant/www/phpinfo/public_html',
}

class { "mysql":
  root_password => 'password',
}
mysql::grant { "drupal":
  mysql_privileges => 'ALL',
  mysql_password => 'password',
  mysql_db => 'drupal',
  mysql_user => 'drupal',
  mysql_host => 'localhost',
}
class { "php": }
php::module { "mysql": }
php::module { "dom": }
php::module { "gd": }
php::module { "mbstring": }
*/
php::pear::module { "drush": 
  use_package => 'no',
}
/*
pear config-set auto_discover 1
pear -d preferred_state=stable install drush

package { "pear-pear.drush.org-drush":
  name => "drush",
  provider => "pear",
  source => "pear.drush.org/drush/drush",
  ensure => "latest",
  #require => Class["php::pear"],
}
*/
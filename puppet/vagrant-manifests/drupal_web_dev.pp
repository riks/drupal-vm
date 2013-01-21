class { "iptables": }

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
php::module { "xml": }
php::module { "gd": }
php::module { "mbstring": }

include pear
pear::package { "PEAR": }
pear::package { "Console_Table": }
pear::package { "drush":
  version => "5.8.0",
  repository => "pear.drush.org",
  require => Pear::Package["PEAR"],
}
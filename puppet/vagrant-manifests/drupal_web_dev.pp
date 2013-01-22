class { "iptables": 
  config => 'file',
}

exec { "open port 80":
  command => "iptables -I INPUT -p tcp --dport 80 -j ACCEPT",
  path    => "/sbin/",
}
exec { "open port 80 save":
  command => "service iptables save",
  path    => "/sbin/",
}

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

#class { "pear": }
#pear::package { "PEAR": }
#pear::package { "Console_Table": }
#pear::package { "drush":
  #version => "5.8.0",
  #repository => "pear.drush.org",
  #require => Pear::Package["PEAR"],
#}
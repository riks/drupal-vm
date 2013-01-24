# update os (yum update)

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
# memory_limit = 256M

#class { "pear": }
#pear::package { "PEAR": }
#pear::package { "Console_Table": }
#pear::package { "drush":
  #version => "5.8.0",
  #repository => "pear.drush.org",
  #require => Pear::Package["PEAR"],
#}

# http://www.krizna.com/centos/how-install-phpmyadmin-centos-6/
# phpMyAdmin

#cron { "drupal-cron-localhost":
#  command => "wget -O - -q -t 1 http://localhost/cron.php",
#  hour => inline_template("<%= name.hash % 24 %>"),
#  minute => "00",
#}


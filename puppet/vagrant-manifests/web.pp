$firewall = false
$firewall_tool = [ "iptables" ]

class { "iptables": 
  disable => true,
}
class { "rsync": 
  disable => true,
}
class { "yum": }
class { "apache": }
apache::vhost { 'localhost':
  docroot  => '/vagrant/www/localhost/public_html',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}

class { "mysql":
  root_password => 'password',
  template => "/tmp/vagrant-puppet/manifests/templates/my.conf.erb",      
}
mysql::grant { "drupal02":
  mysql_password => 'password',
  mysql_db => 'drupal',
  mysql_user => 'drupal',
}

class { "php": 
  template => '/tmp/vagrant-puppet/manifests/templates/php.ini.erb',
  #display_errors
}
php::module { "mysql": }
php::module { "xml": }
php::module { "gd": }
php::module { "mbstring": }  

class { "pear": }
pear::package { "PEAR": 
  version => "1.9.4",
}
pear::package { "Console_Table": 
  version => "1.1.5",
}
pear::package { "drush":
  version => "5.8.0",
  repository => "pear.drush.org",
  require => Pear::Package["PEAR"],
}

#cron { "drupal-cron-localhost":
#  command => "wget -O - -q -t 1 http://localhost/cron.php",
#  hour => inline_template("<%= name.hash % 24 %>"),
#  minute => "00",
#}

# Password required.
#drush sql-sync @live @local --create-db --simulate=0

exec { "drush dl panopoly":
  command => "drush dl -y -v --destination=/tmp/drush panopoly",
  path    => "/usr/bin/",
  require => Pear::Package["drush"],
}
exec { "mv panopoly":
  command => "mv /tmp/drush/panopoly-7.x-1.0-rc3 /vagrant/www/localhost/public_html",
  path    => "/bin/",
  require => Pear::Package["drush"],
}
exec { "drush si panopoly":
  command => "drush si -y -v --root=/vagrant/www/localhost/public_html/ --db-url=mysql://root:password@127.0.0.1/drupal panopoly",
  path    => "/usr/bin/",
  require => Pear::Package["drush"],
}
#apache::vhost { 'phpmyadmin':
#  docroot  => '/vagrant/www/localhost/public_html',
#  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
#}
#package { phpmyadmin:
#  ensure => present,
#  require => [ Package["php"], Php::Module["mysql"], File["yum.conf"] ],
#  notify => Service["apache"],
#}

#sendmail/postfix
#yum install nfs-utils nfs-utils-lib
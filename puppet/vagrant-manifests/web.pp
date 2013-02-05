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
class { "mysql":
  root_password => 'password',
  template => "/tmp/vagrant-puppet/manifests/templates/my.conf.erb",      
}
class { "php": 
  template => '/tmp/vagrant-puppet/manifests/templates/php.ini.erb',
  options => {
    'display_errors' => 'On',
    'timezone' => 'Europe/Berlin',
  }
}
php::module { "mysql": }
php::module { "xml": }
php::module { "gd": }
php::module { "mbstring": }  
class { "pear": }
#"pear channel-update pear.php.net"
pear::package { "PEAR": 
  version => "1.9.4",
}
pear::package { "Console_Table": 
  version => "1.1.5",
  require => Pear::Package["PEAR"],
}
pear::package { "drush":
  version => "5.8.0",
  repository => "pear.drush.org",
  require => Pear::Package["PEAR"],
}



apache::vhost { 'localhost':
  docroot  => '/vagrant/www/localhost/public_html',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}
mysql::grant { "drupal":
  mysql_password => 'password',
  mysql_db => 'drupal',
  mysql_user => 'drupal',
}


apache::vhost { 'panopoly':
  docroot  => '/vagrant/www/panopoly/public_html',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}
mysql::grant { "panopoly":
  mysql_password => 'password',
  mysql_db => 'panopoly',
  mysql_user => 'panopoly',
}
#exec { "drush dl panopoly":
#  command => "/usr/bin/drush dl panopoly --destination=/tmp/drush -y",
#  require => Pear::Package["drush"],
#}
#file { "/vagrant/www/panopoly":
#    ensure => "directory",
#}
#exec { "mv panopoly":
#  command => "/bin/mv /tmp/drush/panopoly-7.x-1.0-rc3 /vagrant/www/panopoly/public_html",
#  require => Exec["drush dl panopoly"],
#}
#exec { "drush si panopoly":
#  command => "/usr/bin/drush si panopoly --db-url=mysqli://root:password@localhost/drupal --root=/vagrant/www/panopoly/public_html -y",
#  require => Exec["mv panopoly"],
#}
#cron { "drupal-cron-localhost":
#  command => "wget -O - -q -t 1 http://localhost/cron.php",
#  hour => inline_template("<%= name.hash % 24 %>"),
#  minute => "00",
#}
# Password required.
#drush sql-sync @live @local --create-db --simulate=0
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

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
  template      => "/tmp/vagrant-puppet/manifests/templates/my.conf.erb",      
}
class { "php": 
  template => '/tmp/vagrant-puppet/manifests/templates/php.ini.erb',
  options  => {
    'display_errors' => 'On',
    'timezone'       => 'Europe/Berlin',
  }
}



package {"pcre-devel":
  ensure => latest,
}
php::module { "devel": }
php::pecl::module { "apc":
  use_package => 'no',
  require     => [ Php::Module["devel"], Package["pcre-devel"] ],
}
file {"/etc/php.d/apc.ini":
  ensure  => present,
  content => template('/tmp/vagrant-puppet/manifests/templates/apc.ini.erb'),
}
# add apc vhost for admin panel.
# http://apc:8888/apc.php
apache::vhost { "apc":
  docroot  => '/usr/share/pear',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}



php::module { "mysql": }
php::module { "xml": }
php::module { "gd": }
php::module { "mbstring": }
php::module { "mcrypt": 
  require => Yum::Managed_yumrepo["epel"],
}
package { "phpMyAdmin":
  ensure  => latest,
  require => [ Yum::Managed_yumrepo["epel"], Php::Module["mysql"] ],
}
apache::vhost { "phpmyadmin":
  docroot  => '/usr/share/phpMyAdmin',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}
file { "/etc/httpd/conf.d/phpMyAdmin.conf":
  ensure  => absent,
  require => Package["phpMyAdmin"],
}
class { "pear": }
pear::package { "PEAR": 
  version => "1.9.4",
}
pear::package { "Console_Table": 
  version => "1.1.5",
  require => Pear::Package["PEAR"],
}
pear::package { "drush":
  version    => "5.8.0",
  repository => "pear.drush.org",
  require    => Pear::Package["PEAR"],
}

apache::vhost { "bq":
  docroot  => '/vagrant/www/localhost/public_html',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}
mysql::grant { "bq":
  mysql_password => 'password',
  mysql_db   => 'bq',
  mysql_user => 'bq',
}

apache::vhost { "pkv":
  docroot  => '/vagrant/www/pkv/public_html',
  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
}
mysql::grant { "pkv":
  mysql_password => 'password',
  mysql_db   => 'pkv',
  mysql_user => 'pkv',
}

#file { "/vagrant/www/bmas":
#    ensure => "directory",
#}
#apache::vhost { "bmas":
#  docroot  => '/vagrant/www/bmas/public_html',
#  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
#}
#mysql::grant { "bmas":
#  mysql_password => 'password',
#  mysql_db       => 'bmas',
#  mysql_user     => 'bmas',
#}
#apache::vhost { "panopoly":
#  docroot  => '/vagrant/www/panopoly/public_html',
#  template => '/tmp/vagrant-puppet/manifests/templates/vhost.conf.erb',
#}
#mysql::grant { "panopoly":
#  mysql_password => 'password',
#  mysql_db       => 'panopoly',
#  mysql_user     => 'panopoly',
#}
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
#  hour    => inline_template("<%= name.hash % 24 %>"),
#  minute  => "00",
#}
# Password required.
#drush sql-sync @live @local --create-db --simulate=0
#sendmail/postfix
#yum install nfs-utils nfs-utils-lib

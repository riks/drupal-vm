class web {
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
  mysql::grant { "drupal":
    mysql_privileges => 'ALL',
    mysql_password => 'password',
    mysql_db => 'drupal',
    mysql_user => 'drupal',
    mysql_host => 'localhost',
  }
  
  class { "php": 
    template => '/tmp/vagrant-puppet/manifests/templates/php.ini.erb',    
  }
  php::module { "mysql": }
  php::module { "xml": }
  php::module { "gd": }
  php::module { "mbstring": }  
  php::module { "mcrypt": 
    require => Class["yum"],
  }
  
  class { "pear": }
  pear::package { "PEAR": }
  pear::package { "Console_Table": }
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
}

class web {
  class { 'rsync': }
  # update os (yum update)
  
  #class { "iptables": }
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
	#<Directory /vagrant/www/localhost/public_html>
	  #AllowOverride All
    #</Directory>
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
  #max_allowed_packet 
  
  class { "php": }
  php::module { "mysql": }
  php::module { "xml": }
  php::module { "gd": }
  php::module { "mbstring": }
  
  #rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/i386/epel-release-6-8.noarch.rpm
  php::module { "mcrypt": }
  # memory_limit = 256M
  
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
}

include web

#exec { "open port 9999":
#  command => "iptables -I INPUT -p tcp --dport 9999 -j ACCEPT",
#  path    => "/sbin/",
#}
#exec { "open port 9999 save":
#  command => "service iptables save",
#  path    => "/sbin/",
#}

#apache::vhost { 'phpMyAdmin':
#  port => 9999,
#  docroot  => '/vagrant/www/localhost/public_html',
#}

# http://www.krizna.com/centos/how-install-phpmyadmin-centos-6/
# phpMyAdmin

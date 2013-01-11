# TODO: Search for a iptables/more generic module
# https://github.com/puppetlabs/puppetlabs-firewall
# http://geek.jasonhancock.com/2011/10/11/managing-iptables-firewalls-with-puppet/
exec { "open port 80":
    command => "iptables -I INPUT -p tcp --dport 80 -j ACCEPT",
    path    => "/sbin/",
}
exec { "open port 80 save":
    command => "service iptables save",
    path    => "/sbin/",

}

include apache
include php
php::extension {"mysql":}
include mysql::server
# default params überschreiben, z.b. loglevel bei dev auf info stellen.
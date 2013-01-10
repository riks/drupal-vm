## drupal-vm

# Initial setup on host
Install on host:
* Virtualbox
* Vagrant
* Puppet
* Git

Weblinks
* http://devops.me/2011/10/07/bootstrapping-vagrant-with-puppet/
* http://net.tutsplus.com/tutorials/php/vagrant-what-why-and-how/
* http://bitfieldconsulting.com/puppet-drupal
* http://shapeshed.com/setting-up-puppet-on-ubuntu-10-04/
* https://github.com/drupalboxes/drupal-puppet
* http://css.dzone.com/articles/creating-virtual-server

# Prepare your tools and environment
* Create a working directory on your host.
* cd into this directory.
* git clone https://github.com/Bussmeyer/drupal-vm.git
* cd drupal-vm

# Create and use your virtual machine
* vagrant up
* vagrant ssh
* http://localhost:8888

# Firewall
* Centos Firewall: 
* http://www.rackspace.com/knowledge_center/article/centos-apache-and-php-install#Apache_Install
* http://geek.jasonhancock.com/2011/10/11/managing-iptables-firewalls-with-puppet/
* https://github.com/example42/puppet-iptables

# TODO (a more modular approach)
* CI VM (Jenkins, PHPUnit, Simpletest, Drush, Drush make, Selenium)
* Dev VM enhance, more modular approach
* Builder (Vagrant, Virtualbox, Puppet)
* Drupal Blueprint (Drupal, Features, Install profile, make file, aliases, directory structure)
* Eclipse settings for local drupal, php, symfony development
* Puppet Manifest for logration settings.
* Define a location for the logs of vhosts.
* Install Samba on Dev instead of shared folders (http://charlesa.net/tutorials/centos/centossamba.php, http://wiki.centos.org/HowTos/SetUpSamba)

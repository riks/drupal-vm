## drupal-vm
Build local VMs with vagrant for your drupal development.

# Requirements on your local computer
* Virtualbox
* Vagrant
* Puppet
* Git

Weblinks
* http://devops.me/2011/10/07/bootstrapping-vagrant-with-puppet/
* http://net.tutsplus.com/tutorials/php/vagrant-what-why-and-how/
* http://bitfieldconsulting.com/puppet-drupal
* https://github.com/drupalboxes/drupal-puppet
* http://css.dzone.com/articles/creating-virtual-server
* http://puppetcookbook.com/

# Prepare your tools and environment
* Create a working directory on your host.
* cd into this directory.
* git clone https://github.com/Bussmeyer/drupal-vm.git
* cd drupal-vm
* vagrant up
* vagrant ssh
* http://localhost:8888

# TODO (a more modular approach)
* CI VM (Jenkins, PHPUnit, Simpletest, Drush, Drush make, Selenium)
* Dev VM enhance, more modular approach
* Builder VM (Vagrant, Virtualbox, Puppet)
* Drupal Blueprint (Drupal, Features, Install profile, make file, aliases, directory structure)
* Eclipse settings for local drupal, php, symfony development
* Puppet Manifest for logrotation settings.
* Puppet module tomcat and solr
* Define a location for the logs of vhosts.
* Create dev, test, prod nodes in the vagrant file.
* xdebug
* Change puppet-php repo: add a params to use another pear channel.

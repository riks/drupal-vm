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
* http://puppetcookbook.com/

# Prepare your tools and environment
* Create a working directory on your host.
* cd into this directory.
* git clone https://github.com/Bussmeyer/drupal-vm.git
* cd drupal-vm

# Create and use your virtual machine
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
* Install Samba on Dev instead of shared folders (http://charlesa.net/tutorials/centos/centossamba.php, http://wiki.centos.org/HowTos/SetUpSamba)
* Check the use of git submodule. Create a central repo for puppet modules and include them in the project repo.
* Change puppet-php repo: add a params to use another pear channel.

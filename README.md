## drupal-vm
# Initial setup on host
Install on host:
* Virtualbox
* Vagrant
* Puppet
* Git

# Prepare your tools and environment
* Create a working directory on your host.
* cd into this directory.
* git clone https://github.com/Bussmeyer/drupal-vm.git
* cd drupal-vm
* vagrant up
* vagrant ssh
* http://localhost:8888

# TODO
* Puppet Manifest for logrotation settings.
* Puppet module tomcat and solr
* Create dev, test, prod nodes in the vagrant file.
* Add xdebug in php.ini
* Change puppet-php module (pull request): add a params to use another pear channel.
* CI VM (Jenkins, PHPUnit, Simpletest, Drush, Drush make, Selenium)
* Eclipse settings for local drupal, php, symfony development

# Weblinks
* http://devops.me/2011/10/07/bootstrapping-vagrant-with-puppet/
* https://github.com/drupalboxes/drupal-puppet
* http://puppetcookbook.com/
* http://www.cyberciti.biz/faq/centos-fedora-redhat-linux-installing-phpmyadmin-webtool/

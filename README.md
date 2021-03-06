## drupal-vm
Create and manage local VMs with vagrant, puppet and git for your drupal development.

# Install requirements on your local computer
* Virtualbox (https://www.virtualbox.org/)
* Vagrant (http://www.vagrantup.com/)
* Puppet (http://puppetlabs.com/)
* Git (http://git-scm.com/)

# Create a new local VM
* cd into a workspace directory. (e.g. cd ~/workspace)
* git clone https://github.com/Bussmeyer/drupal-vm.git
* cd drupal-vm
* git submodule update --init --recursive
* vagrant up

# Check the results and start working
* SSH: vagrant ssh
* Browser: http://localhost:8888
* IDE: Use the shared folder (e.g. cd ~/workspace/www)

# TODO
* Add phpMyAdmin with vhost http://localhost:9999
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
* http://www.adayinthelifeof.nl/2012/06/29/using-vagrant-and-puppet-to-setup-your-symfony2-environment/
* Use dir structure: https://github.com/crohr/vagrant-presentation
* http://mechanics.flite.com/blog/2012/07/24/better-dev-environments-with-vagrant-and-dotfiles/

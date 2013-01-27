# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :drupal_web do |drupal_web_config|
    #drupal_web_config.vm.network :hostonly, "192.168.33.10"
    drupal_web_config.vm.box = "centos63"
    drupal_web_config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
    drupal_web_config.vm.share_folder("v-web", "/vagrant/www", "./www", { :create => true })
    #drupal_web_config.vm.share_folder("v-logs", "/etc/httpd/logs", "./logs", { :create => true })
    drupal_web_config.vm.forward_port 22, 2222, { :name => "ssh" }
    drupal_web_config.vm.forward_port 80, 8888, { :name => "http" }
    drupal_web_config.vm.forward_port 9999, 9999, { :name => "http_pma" }
    
    drupal_web_config.vm.customize ["modifyvm", :id, "--memory", 512]
    
	# Set the Timezone to something useful
    #config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
    # Update the server
    #config.vm.provision :shell, :inline => "apt-get update --fix-missing"
    drupal_web_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.manifest_file = "drupal_web_dev.pp"
      puppet.module_path = "puppet/modules"
      puppet.options = "--verbose"
    end
  end
end
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :web_dev do |web_dev_config|
    #web_dev_config.vm.network :hostonly, "192.168.33.10"
    web_dev_config.vm.box = "centos63"
    web_dev_config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
    web_dev_config.vm.share_folder("v-web", "/vagrant/www", "./www", { :create => true })
    #web_dev_config.vm.share_folder("v-logs", "/etc/httpd/logs", "./logs", { :create => true })
    web_dev_config.vm.forward_port 22, 2222, { :name => "ssh" }
    web_dev_config.vm.forward_port 80, 8888, { :name => "http" }
    web_dev_config.vm.forward_port 9999, 9999, { :name => "http_pma" }
    
    web_dev_config.vm.customize ["modifyvm", :id, "--memory", 512]
    
	# Set the Timezone to something useful
    #web_dev_config.vm.provision :shell, :inline => "echo \"Europe/London\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
    # Update the server
    #web_dev_config.vm.provision :shell, :inline => "apt-get update --fix-missing"
    web_dev_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.manifest_file = "web_dev.pp"
      puppet.module_path = "puppet/modules"
      puppet.options = "--verbose"
    end
  end
end
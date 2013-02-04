# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :web_dev do |web_dev_config|
    web_dev_config.vm.network :hostonly, "33.33.33.10"
    web_dev_config.vm.box = "centos63"
    web_dev_config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
    web_dev_config.vm.share_folder("v-web", "/vagrant/www", "./www", { :create => true, :nfs => true, nfs_version => 4 })
    # wenn apple, dann nfs
    
    #web_dev_config.vm.share_folder("v-logs", "/etc/httpd/logs", "./logs", { :create => true })
    web_dev_config.vm.forward_port 22, 2222, { :name => "ssh" }
    web_dev_config.vm.forward_port 80, 8888, { :name => "http" }
    #web_dev_config.vm.forward_port 9999, 9999, { :name => "http_pma" }
    web_dev_config.vm.customize ["modifyvm", :id, "--memory", 512]

    # Fixing stability and performance issues
    # https://www.virtualbox.org/ticket/8474
    #config.vm.customize ["modifyvm", :id, "--hwvirtex", "off"]
    #config.vm.customize ["modifyvm", :id, "--vtxvpid", "off"]
    #config.vm.customize ["modifyvm", :id, "--ioapic", "off"]
    #config.vm.customize ["modifyvm", :id, "--pae", "off"]
    #config.vm.customize ["modifyvm", :id, "--nestedpaging", "off"]
    #config.vm.customize ["modifyvm", :id, "--largepages", "off"]
 	#config.vm.customize ["setextradata", :id, "VBoxInternal/Devices/ahci/0/LUN#0/Config/FlushInterval", "1000000"]
 
    
    web_dev_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.manifest_file = "web.pp"
      puppet.module_path = "puppet/modules"
      puppet.options = "--verbose --debug --trace --summarize"
    end
  end
end
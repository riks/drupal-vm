# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :web_dev do |web_dev_config|
    #web_dev_config.vm.network :hostonly, "192.168.33.10"
    web_dev_config.vm.box = "centos63"
    web_dev_config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
    web_dev_config.vm.share_folder("v-web", "/vagrant/www", "./www", { :create => true, :nfs => (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/) })
    web_dev_config.vm.forward_port 22, 2222, { :name => "ssh" }
    web_dev_config.vm.forward_port 80, 8888, { :name => "http" }
    #web_dev_config.vm.forward_port 9999, 9999, { :name => "http_pma" }
    web_dev_config.vm.customize ["modifyvm", :id, "--memory", 1024]
    web_dev_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.manifest_file = "web.pp"
      puppet.module_path = "puppet/modules"
      puppet.options = "--debug --trace --summarize"
    end
  end
end
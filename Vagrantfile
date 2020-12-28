# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"


boxes = [
    {
        :name => "worker1",
        :eth1 => "192.168.205.10",
        :mem => "1024",
        :cpu => "1"
    },
	{
        :name => "worker2",
        :eth1 => "192.168.205.11",
        :mem => "1024",
        :cpu => "1"
    }
]

Vagrant.configure(2) do |config|

  config.vm.box = "centos/7"
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = opts[:mem]
        v.vmx["numvcpus"] = opts[:cpu]
      end
      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end
      config.vm.network :private_network, ip: opts[:eth1]
	  #config.ssh.forward_agent = true
	  config.vm.synced_folder '.', '/vagrant', disabled: true
	  config.vm.synced_folder "C:/work/vagrant_work/nginx_box/share_file","/home/vagrant/share_file"
    end
  end
end
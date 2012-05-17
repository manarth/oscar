# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.share_folder("v-root", "/vagrant", ".")

  config.vm.network :hostonly, "192.168.33.10"
  # config.vm.network :bridged

  # Port Forwarding
  # Port Forwarding isn't used because the VM exposes its IP via Avahi,
  # and most development won't need external access.
  # Add port-forwarding entries here if you need them.
  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # The puppet config builds all the services such as Apache, MySQL, etc.
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "base.pp"
  end

end

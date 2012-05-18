# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # This box was originally based against lucid32.
  config.vm.box = "lucid32"

  config.vm.share_folder("v-root", "/vagrant", ".")
  
  # This box is created with the hostname "vagrant-drupaldev.local".
  config.vm.host_name = "vagrant-drupaldev"


  # Optional network modes.
  # - Host-only
  # - NAT       Sets up a local private network to the host, but forwards
  #             external HTTP requests as needed.
  # - Bridged   Relies on an external DHCP server. Typically doesn't suit
  #             corporate networks.
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
  # These paths are relative to this Vagrant file.
  puppetpath = File.expand_path(__FILE__ + '/../puppet');

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = puppetpath + "/modules",

    puppet.manifests_path = puppetpath + "/manifests",
    puppet.manifest_file  = puppetpath + "/manifests/base.pp"
  end

end

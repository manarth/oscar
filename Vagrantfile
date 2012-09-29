# -*- mode: ruby -*-
# vi: set ft=ruby :


###
# This is the Vagrantfile used by Oscar instances.
###
Vagrant::Config.run do |config|


  build_box = "oscar"


  # Get the path to this box instance.
  # TODO: Validate this lookup is correct.
  instance_path = File.expand_path("")


  # The directory name is used to build the host-names.
  # E.g. the directory "foobar" will produce the boxes:
  # * vm-foobar-drupaldev
  # * vm-foobar-drupalsvcs
  # * vm-foobar-drupaltest
  directory = File.basename(instance_path)


  # Hostname labels are 1-63 characters.
  # NETBIOS (Samba) limits the name length to 15 characters

  # Define the primary Drupal box.
  # This is the primary VM box, which means that it'll be the one acted-upon,
  # unless a box-name parameter is passed.
  config.vm.define :drupal, :primary => true do |drupal_config|
    drupal_config.vm.box = build_box
    drupal_config.vm.host_name = "vm-" + directory + "-drupaldev"
    drupal_config.vm.network :hostonly, "192.168.1.10"
  end

  # Define the Services box.
  config.vm.define :services do |services_config|
    services_config.vm.box = build_box
    services_config.vm.host_name = "vm-" + directory + "-drupalsvcs"
    services_config.vm.network :hostonly, "192.168.1.11"
  end

  # Define the Test box.
  config.vm.define :test do |test_config|
    test_config.vm.box = build_box
    test_config.vm.host_name = "vm-" + directory + "-drupaltest"
    test_config.vm.network :hostonly, "192.168.1.12"
  end

end

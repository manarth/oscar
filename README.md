About Project Oscar
===================
Project Oscar is a Drupal development environment, in a jiffy.
It provides a stack of installed and configured services, and all the tools
you'll need to get building sites straight away.

What do you need?
=================
Project Oscar requires:
- VirtualBox 
  http://www.virtualbox.org/
- Vagrant 
  http://vagrantup.com/

Getting started
===============
# Install VirtualBox.
# Install Vagrant.
# Choose a directory to work in. 
  We'll use ~/Development/drupaldev in this example, and assume this directory 
  does not yet exist.
# mkdir -p ~/Development/drupaldev
# cd ~/Development/drupaldev
# vagrant box add oscar http://github.com/manarth/oscar/project_oscar.box 
  This assumes you want to work from the latest (dev) version of Project Oscar. 
  Change the URL if you prefer to use a particular release.
# vagrant init oscar
# vagrant up

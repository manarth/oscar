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
1. Install VirtualBox.
2. Install Vagrant.
3. Choose a directory to work in.  
   We'll use ~/Development/drupaldev in this example, and assume this directory  
   does not yet exist.
4. mkdir -p ~/Development/drupaldev
5. cd ~/Development/drupaldev
6. vagrant box add oscar https://raw.github.com/manarth/oscar/master/packages/project_oscar.box  
   This assumes you want to work from the latest (dev) version of Project Oscar.  
   Change the URL if you prefer to use a particular release.
7. vagrant init oscar
8. vagrant up

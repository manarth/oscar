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


What does Project Oscar provide?
================================
1. A Drupal VM  
   Provides a web server, database, Drush, PHPMyAdmin, and local tools.
2. A services VM (in progress, coming soon!)  
   Provides Solr and Graylog2.


Getting started
===============
1. Preparation (you only need to do this once):
    - Install VirtualBox.
    - Install Vagrant.
    - Download Oscar's base box.  
      `vagrant box add oscar https://github.com/downloads/manarth/oscar/project_oscar.box`  

      This assumes you want to work from the latest (dev) version of Project Oscar.  
      Change the URL if you prefer to use a particular release (actually, we've only  
      got dev at the moment).
2. Project preparation:
    - Choose a directory to work in.  
      We'll use ~/Development/drupaldev in this example, and assume this directory  
      does not yet exist.
    - `mkdir -p ~/Development/drupaldev`
    - `cd ~/Development/drupaldev`
3. `vagrant init oscar`
4. `vagrant up`

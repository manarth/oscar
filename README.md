About Project Oscar
===================
Project Oscar is a Drupal development environment, in a jiffy.  
It provides a stack of installed and configured services, and all the tools
you'll need to get building sites straight away.


What do you need?
=================
Project Oscar requires:

* __VirtualBox__  
  http://www.virtualbox.org/
* __Vagrant__  
  http://vagrantup.com/


What does Project Oscar provide?
================================
1. A Drupal VM  
   Provides a web server, database, Drush, PHPMyAdmin, and local tools.
2. A services VM _(in progress, coming soon!)_  
   Provides Solr and Graylog2.
3. A test VM _(in progress, coming soon!)_  
   Provides a test platform for running Selenium and other browser-based tests.


Getting started
===============
1. Preparation (you only need to do this once):
    - Install VirtualBox.
    - Install Vagrant.
    - Download Oscar's base box.  
      `vagrant box add oscar https://github.com/downloads/manarth/oscar/project_oscar.box`  

      _Right now, this URL assumes working from the dev build of project oscar.  
      Future stable releases will be published on a separate URL._

2. Project preparation:
    - Choose a directory to work in.  
      We'll use ~/Development/drupaldev in this example, and assume this directory  
      does not yet exist.
    - `mkdir -p ~/Development/drupaldev`
    - `cd ~/Development/drupaldev`

3. `vagrant init oscar`  
   _This creates a file in the working directory called `Vagrantfile`, which  
   contains the instructions for Vagrant to build the oscar environment._

4. `vagrant up`  
   _This starts the build process: creating the VMs defined by oscar, and  
   provisioning them with puppet._


Working with Oscar
==================
@TODO.  
Explain how to use `vagrant ssh`, control Oscar with the new (and not-yet-
published Drush commands to build vhosts/drupal environments), etc.


Infrastructure project using puppet

Description

This is project is for managing a virtual machine using puppet manifests. The manifests are purposely broken down to 
their smallest components to provide a logical and intuitive structure. Technologies used in this project are currently;
+ bash,
+ vagrant,
+ puppet,
+ librarian
+ hiera data.

The intention is to have a series of exercises added to build knowledge and confidence in these technologies. 

Vagrant  

project site: https://www.vagrantup.com/

The above site the main page for the building tool vagrant, you will find installation instructions and description of 
the usage of the language. I would suggest if you haven't had much experience to go through the "Getting Started" steps.

Currently the Vagrantfile in this project has been tested on a Windows 10, the size name and image used are variables at
the top of the configuration file. From reading the Vagrant project site you will be aware that it is a descriptive  
language used to create a virtual machine and provision changes to the base image. In our Vagrantfile you will notice
references to both a bash script and puppet with hiera data. These files are used to update install software and modify 
or configure the system. 

Puppet
   
project site: https://puppet.com/

This is a configuration management language for operating systems; we will be using it in this project to add remove 
accounts and configure software. We will be using pre-made puppet modules from <h>https://forge.puppet.com/</h>; 
a repository for puppet modules.

Librarian 

project site: http://librarian-puppet.com/
           
This is a dependency management system for puppet modules; if you view the Puppetfile in this project you will see a 
reference to a forge "repo" and some dependencies. These can also be found in puppet modules and are a way of ensuring 
dependencies can be managed and version controlled.

Hiera data

description: https://puppet.com/docs/puppet/4.10/hiera_intro.html

This is used to apply values to environments in a custom hierarchy fashion.  
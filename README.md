#Infrastructure project using puppet

#### Table of Contents

1. [Description](#description)
    * [Vagrant](#Vagrant)
    * [Puppet](#Puppet)
    * [Librarian](#Librarian)
    * [Hiera data](#Hiera data)
1. [Setup - The basics of getting started with profile](#setup)
    * [What profile affects](#what-profile-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with profile](#beginning-with-profile)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

##Description

This is project is for managing a virtual machine using puppet manifests. The manifests are purposely broken down to 
their smallest components to provide a logical and intuitive structure. Technologies used in this project are currently;
* bash,
* vagrant,
* puppet,
* librarian
* hiera data.

The intention is to have a series of exercises added to build knowledge and confidence in these technologies. 

###Vagrant  

project site: https://www.vagrantup.com/

The above site the main page for the building tool vagrant, you will find installation instructions and description of 
the usage of the language. I would suggest if you haven't had much experience to go through the "Getting Started" steps.

Currently the Vagrantfile in this project has been tested on a Windows 10, the size name and image used are variables at
the top of the configuration file. From reading the Vagrant project site you will be aware that it is a descriptive  
language used to create a virtual machine and provision changes to the base image. In our Vagrantfile you will notice
references to both a bash script and puppet with hiera data. These files are used to update install software and modify 
or configure the system. 

###Puppet
   
project site: https://puppet.com/

This is a configuration management language for operating systems; we will be using it in this project to add remove 
accounts and configure software. We will be using pre-made puppet modules from <h>https://forge.puppet.com/</h>; 
a repository for puppet modules.

###Librarian 

project site: http://librarian-puppet.com/
           
This is a dependency management system for puppet modules; if you view the Puppetfile in this project you will see a 
reference to a forge "repo" and some dependencies. These can also be found in puppet modules and are a way of ensuring 
dependencies can be managed and version controlled.

###Hiera data

description: https://puppet.com/docs/puppet/4.10/hiera_intro.html

This is used to apply values to environments in a custom hierarchy fashion.  

## Setup

### What Infrastructure  affects **OPTIONAL**

This project currently creates a virtual ubuntu box and adds accounts and groups Software to that box. Custom modules
includes;
* profile
* role
* system

Puppetforge modules include; 
* docker
* ntp


### Setup Requirements 

2GB ram 
Vagrant 
VirtualBox


### Beginning with Infrastructure

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Users need a complete list of your module's classes, types, defined types providers, facts, and functions, along with the parameters for each. You can provide this list either via Puppet Strings code comments or as a complete list in this Reference section.

* If you are using Puppet Strings code comments, this Reference section should include Strings information so that your users know how to access your documentation.

* If you are not using Puppet Strings, include a list of all of your classes, defined types, and so on, along with their parameters. Each element in this listing should include:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

## Limitations

Only currently working and tested on Windows 10

## Development

###Tasks,
Branch for Linux compatibility;

Multiple Virtual machines to be started from Vagrantfile to make use of services and and consumers of those services.
Docker swarm to be created.

Exercises to make use and familuarise viewer of technology

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.



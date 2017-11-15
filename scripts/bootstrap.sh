#!/bin/bash

sudo apt-get --yes update
sudo apt-get --yes upgrade
sudo apt-get install --yes ruby
#sudo apt-get --yes install openjdk-8-jre
sudo gem install facter
sudo gem install hiera
sudo gem install gettext-setup


#mkdir ~/bin && cd ~/bin
#curl -L 'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein' -o lein --tlsv1
#chmod ugo+x lein
#./lein
#sudo ln -s ~/bin/lein /usr/local/bin

mkdir -p ~/git && cd ~/git
git clone https://github.com/puppetlabs/puppet.git
cd puppet
git checkout remotes/origin/4.10.x

# Download the dependencies
#lein deps

sudo ruby install.rb
cd ~ && rm -rf ~/git



#!/bin/sh
curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt-get update
sudo apt-get install puppet-agent -y
echo "alias puppet='/opt/puppetlabs/bin/puppet'" >> ~/.bashrc

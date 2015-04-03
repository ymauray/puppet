# puppet
Configuration Puppet pour mes serveurs

Installer Puppet :
==================
sudo dpkg -i support/puppetlabs-release-trusty.deb
sudo apt-get update
sudo apt-get install puppet

Ajouter le module apt : 
=======================
sudo puppet module install puppetlabs-apt

Appliquer puppet :
==================
sudo puppet apply site.pp


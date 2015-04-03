# puppet
Configuration Puppet pour mes serveurs.
Je part du principe que j'utilise mon compte (yannick) et que mon répertoire racine est /home/yannick

# Pré-installation
Installation de Git :
```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install build-essential git
$ git pull git@github.com:ymauray/puppet.git
```

Installation de Puppet :
```
$ sudo dpkg -i support/puppetlabs-release-trusty.deb
$ sudo apt-get update
$ sudo apt-get install puppet
```

Ajouter le module apt : 
```
$ puppet module install puppetlabs-apt --modulepath=/home/yannick/puppet/modules
```

Appliquer puppet :
```
$ sudo puppet apply site.pp --modulepath=/home/yannick/puppet/modules
```

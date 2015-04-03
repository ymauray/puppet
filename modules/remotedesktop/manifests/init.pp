include apt

class remotedesktop {
class { 'apt' :
	always_apt_update => "true",
}

	apt::ppa { "ppa:x2go/stable" : 
		alias => "x2go"
	}

	package { "lxde":
		ensure => "latest",
	}

	package { "x2goserver" :
		ensure => "latest",
	}

	package { "x2goserver-xsession" :
		ensure => "latest",
	}

	Apt::Ppa["ppa:x2go/stable"] -> Package["x2goserver"]
	Apt::Ppa["ppa:x2go/stable"] -> Package["x2goserver-xsession"]
}


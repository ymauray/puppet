class firewall {

	package { "iptables" :
		ensure => "latest"
	}

	file { "/etc/init.d/firewall" :
		alias => "firewall.init",
		require => Package["iptables"],
		source => "puppet:///modules/firewall/firewall",
		owner => root,
		group => root,
		mode => 755 
	}

	service { "firewall" :
		require => File["firewall.init"],
		ensure => "running"
	}

}

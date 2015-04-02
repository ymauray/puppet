class apache {
	package { 'apache2' :
		ensure => latest
	}

	service { 'apache2' :
		require => Package['apache2'],
		ensure => running,
		enable => true
	}
}

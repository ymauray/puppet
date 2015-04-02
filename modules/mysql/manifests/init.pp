class mysql {
	$password = "gscmmj12"

	package { 'mysql-server' :
		ensure => latest
	}

	exec { "Set MySQL server root password" :
		subscribe => Package["mysql-server"],
		refreshonly => true,
		unless => "mysqladmin -uroot -p$password status",
		path => "/bin:/usr/bin",
		command => "mysqladmin -uroot password $password"
	}

	service { "mysql" :
		require => Package['mysql-server'],
		ensure => running,
		enable => true
	}
}

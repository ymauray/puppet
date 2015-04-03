class tomcat {

	package { "tomcat7" : ensure => "latest" }
	package { "tomcat7-admin" : ensure => "latest" }
	package { "tomcat7-user" : ensure => "latest" }

	service { "tomcat7" :
		require => Package["tomcat7", "tomcat7-admin", "tomcat7-user"],
		ensure => running,
		enable => true
	}

}

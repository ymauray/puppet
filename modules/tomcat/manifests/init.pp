class tomcat {

	package { "tomcat7" : ensure => latest }
	package { "tomcat7-admin" : ensure => latest }
	package { "tomcat7-user" : ensure => latest }

	service { "tomcat7" :
		ensure => running,
		enable => true
	}

}

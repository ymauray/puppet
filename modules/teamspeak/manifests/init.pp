class teamspeak {

	$home = "/opt/teamspeak"

	group { "teamspeak" :
		ensure => "present"
	}

	user { "teamspeak" :
		ensure => "present",
		gid => "teamspeak",
		comment => "TeamSpeak user",
		shell => "/usr/bin/fish",
		home => "$home"
	}
	
	file { "$home" :
		alias => "home",
		require => User["teamspeak"],
		ensure => "directory",
		owner => "teamspeak",
		group => "teamspeak",
		mode => 755
	}

	file { "$home/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz" :
		alias => "tarball",
		require => File["home"],
		source => "puppet:///modules/teamspeak/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz"
	}

	exec { "tar xvf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz" :
		alias => "untar",
		require => File["tarball"],
		cwd => "$home",
		path => "/bin:/usr/bin"
	}

	file { "$home/teamspeak3-server_linux-amd64/ts3server.sqlitedb" :
		require => Exec["untar"],
		alias => "sqlitedb",
		source => "puppet:///modules/teamspeak/ts3server.sqlitedb",
		owner => "teamspeak",
		group => "teamspeak",
		mode => 644
	}

	exec { "rm teamspeak3-server_linux-amd64-3.0.11.2.tar.gz" :
		alias => "cleanup",
		subscribe => Exec["untar"],
		refreshonly => "true",
		cwd => "$home",
		path => "/bin:/usr/bin"
	}

	file { "/etc/init.d/ts3server_linux_amd64" :
		require => Exec["cleanup"],
		alias => "startup.script",
		source => "puppet:///modules/teamspeak/teamspeak3.init",
		owner => "root",
		group => "root",
		mode => 755
	}

	service { "ts3server_linux_amd64" :
		require => File["startup.script"],
		ensure => "running",
		hasstatus => "false",
		start => "sudo -u teamspeak $home/teamspeak3-server_linux-amd64/ts3server_startscript.sh start",
		stop => "sudo -u teamspeak $home/teamspeak3-server_linux-amd64/ts3server_startscript.sh stop"
	}	
}


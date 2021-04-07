# Check_WinLogs

Plugin for nagios to check string inside file

1.- Define command in /usr/local/nagios/etc/objects/commands.cfg

define command{<br/>
	command_name	check_winlog<br/>
	command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 30 -p 5666 -c check_winlog $ARG1$ $ARG2$ <br/>
}

2.-Define Service in Host.cfg (this example check file c:\test.log and find string Error)<br/>

define service{<br/>
	use 			 generic-service<br/>
	host_name		 YOUR_HOST<br/>
	service_description	 Check_logs_test<br/>
	check_command		 check_winlog! -a c:/test.log Error<br/>
}

3.- Put Check_WinLog.ps1 in C:\Program Files\NSClient++\scripts<br/>

4.- Edit nsclient.ini in you Host and add the followin lines<br/>

[/settings/external scripts/wrapped scripts]<br/>
check_winlog = Check_WinLog.ps1  $ARG1$ $ARG2$<br/>

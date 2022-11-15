# Check_WinLogs

Plugin for nagios to check string inside file

1.- Define command in /usr/local/nagios/etc/objects/commands.cfg
```yaml
define command{
        command_name	check_winlog
        command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 30 -p 5666 -c check_winlog -a $ARG1$ $ARG2$
}
```
2.-Define Service in Host.cfg (this example check file c:\test.log and find string Error)<br/>
```yaml
define service{
        use 			 generic-service
        host_name		 YOUR_HOST
        service_description	 Check_logs_test
        check_command		 check_winlog! c:/test.log Error
}
```
3.- Put Check_WinLog.ps1 in C:\Program Files\NSClient++\scripts<br/>

4.- Edit nsclient.ini in your Host and add the followin lines<br/>
```yaml
[/settings/external scripts/wrapped scripts]
check_winlog = Check_WinLog.ps1  $ARG1$ $ARG2$
```

# Remote Management, Present day

## Task 1: Interactive Sessions
1. Make sure you are logged on to LON-CL1.
1. Start a new PowerShell console.
1. Run this command: ```Enter-PSSession -ComputerName LON-DC1```
1. You enter a remote prompt on the LON-DC1 server. Like Telnet, it's a text-based interface. Unlike Telnet, it's an encrypted session.
1. Run this command: ```Get-Process```
1. This displays a process listing from LON-DC1.
1. Run this command: ```Get-EventLog System –Newest 5```
1. This displays the latest events from the system log on LON-DC1.
1. Run this command: ```Get-WmiObject win32_bios```
1. This displays the bios information from LON-DC1.
1. Run this command: ```Install-windowsfeature NLB```
1. The Network Load Balancing feature is being installed on LON-DC1.
1. The previous commands were all executed over the interactive PowerShell session, which uses the WinRM protocol. Most commands can be executed in alternative, and more old-fashioned ways. WinRM is the preferred method of managing remote systems.
1. Run this command to exit the remote session and return to your local PowerShell session: ```Exit-PSSession```


## Task 2: Invoke-Command
In the previous task you created an interactive sessions. This can not be used in nightly, or unattended scripts. In this task you're using Invoke-Command to prevent the use of an interactive session.
1. Run this command: ```Invoke-Command { Get-ChildItem C:\ } –ComputerName LON-DC1```
1. This command creates a WinRM session with LON-DC1, runs the Get-ChildItem command, returns the data and closes the remote session.
1. Run this command to create a local variable: ```$a = 'spooler'```
1. Run this command to restart the spooler service: ```Restart-Service $a```
1. Now run the previous command in a remote session: ```Invoke-Command { Restart-Service $a } –ComputerName LON-DC1```
1. You'll receive an error message, indicating that the argument is empty. This is because $a is a local variable. It does not exist in a remote session.
1. Local variables can be brought to the remote session using a param() section. This is a somewhat old-fashined way of bringing local parameters to a remote session.
1. Run this command: ```Invoke-Command { param($x); Restart-Service $x } -ComputerName LON-DC1 -argumentlist $a```
1. There's also a modern and easier way to bring local variables to a remote session. Notice the differences in the next command:
1. ```Invoke-Command { Restart-Service $Using:a } -ComputerName LON-DC1```
1. Short and simple.

## Task 3: fan out
By default, a remote session can work with 32 computers at the same time. This can be influence by the ThrottleLimit parameter.

Enable-PSRemoting # -force


## Task 3: remoting sessions
1. Run this command: ```$PCs = New-PSSession –ComputerName Server1, Server2, Client1
1. Run this command: ```$PCs
1. Run this command: ```Invoke-Command –Session $PCs –ScriptBlock { gwmi win32_logicaldisk } | Select PSComputerName, Name, Freespace


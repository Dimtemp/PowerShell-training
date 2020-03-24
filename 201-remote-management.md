# Remote Management, Present day

## Task 1: Interactive Sessions
1. Make sure you are logged on to LON-CL1.
1. Start a new PowerShell console.
1. Run this command: ```Enter-PSSession -ComputerName LON-DC1```
1. You enter a remote prompt on the LON-DC1 server. Like Telnet, it's a text-based interface. Unlike Telnet, it's an encrypted session.
1. Run this command: ```Get-Process
1. Run this command: ```Get-EventLog System –Newest 5
1. Run this command: ```Get-WmiObject win32_bios # extra uitleg: ipv gwmi -comp
1. Run this command: ```Install-windowsfeature nlb / telnet-client
1. Run this command: ```Exit-PSSession

## Task 2: Invoke-Command
1. Run this command: ```Invoke-Command { Dir c:\users } –computerName lon-dc1, Server2
1. Run this command: ```Invoke-Command { param($x); start-service $x } -comp server1 -argumentlist $myService 
1. $Using:
Get-NetAdapter -Physical
32 computers at the same time, -ThrottleLimit (invoke-command)
Enable-PSRemoting # -force

## Task 3: remoting sessions
1. Run this command: ```$PCs = New-PSSession –ComputerName Server1, Server2, Client1
1. Run this command: ```$PCs
1. Run this command: ```Invoke-Command –Session $PCs –ScriptBlock { gwmi win32_logicaldisk } | Select PSComputerName, Name, Freespace


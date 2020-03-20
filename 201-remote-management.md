# Remote Management, Present day

## Task1

1. Enter-PSSession -comp LON-DC1   # Kerberos or SSL auth + encryption (like SSH)
1. Get-Process
1. Get-EventLog System –Newest 5
1. Get-WmiObject win32_bios # extra uitleg: ipv gwmi -comp
1. Install-windowsfeature nlb / telnet-client
1. notepad script.ps1 # what happens?
1. double hop: CredSSP required on both computers
1. Enable-WsManCredSSP -Role Client -Delegate <server>
1. Exit-PSSession
1. Invoke-Command { Dir c:\users } –computerName lon-dc1, Server2
1. Invoke-Command { param($x); start-service $x } -comp server1 -argumentlist $myService 
1. $Using:
Get-NetAdapter -Physical
32 computers at the same time, -ThrottleLimit (invoke-command)
Enable-PSRemoting # -force


remoting sessions
$PCs = New-PSSession –ComputerName Server1, Server2, Client1
$PCs
Invoke-Command –Session $PCs –ScriptBlock { gwmi win32_logicaldisk } | Select PSComputerName, Name, Freespace


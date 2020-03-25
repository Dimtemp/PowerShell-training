# Windows Server Management

## basic management
1. ```Get-Eventlog -LogName system```
1. ```Get-WindowsFeature```
1. ```Get-WindowsFeature *telnet*```
1. ```Install-WindowsFeature Telnet-Client```
1. ```Get-WindowsFeature```


## Disk Management
1. ```get-disk```
1. ```get-volume```


Demo 3
1. LON-CL1
	1. Test-Connection LON-DC1
	2. Get-NetIPConfiguration
	3. New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 172.16.0.30 -PrefixLength 24
	4. Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddress 172.16.0.11
	5. Remove-NetRoute -InterfaceAlias Ethernet -DestinationPrefix 0.0.0.0/0 -Confirm:$false
	6. New-NetRoute -InterfaceAlias Ethernet -DestinationPrefix 0.0.0.0/0 -NextHop 172.16.0.2
	7. Get-NetIPConfiguration
	8. Test-Connection LON-DC1
2. LON-SVR1
	1. Install-WindowsFeature Web-Server
	2. mkdir c:\intranet
	3. New-Item C:\intranet -Type Directory
	4. # New-WebAppPool LondonAppPool
	5. New-WebSite London -PhysicalPath C:\intranet
	1. # -IPAddress 172.16.0.15 -ApplicationPool LondonAppPool

Lab 60 min
7. Test-Connection
8. Get-NetIPConfiguration
9. New-NetIPAddress -InterfaceAlias 'Ethernet' -IPAddress 172.16.0.15 -Prefixlength 16
10. Remove-NetIPAddress
11. Set-DnsClientServerAddress
12. Remove-NetRoute
13. New-NetRoute
14. Install-WindowsFeature Web-Server
15. New-Item C:\inetpub\wwwroot\London -Type Directory
16. New-WebAppPool LondonAppPool
17. New-WebSite London -PhysicalPath C:\inetpub\wwwroot\London -IPAddress 172.16.0.15 -ApplicationPool LondonAppPool

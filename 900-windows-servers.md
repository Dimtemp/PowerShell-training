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


# Net
1. Make sure you're connected to LON-SVR1
1. Test-Connection LON-DC1
1. Get-NetIPConfiguration
1. Install-WindowsFeature Web-Server
1. mkdir c:\intranet
1. New-Item C:\intranet -Type Directory
1. New-WebSite London -PhysicalPath C:\intranet

# Windows Server Management

#### Most commands in this section only work on Windows servers. Make sure you're logged on to the LON-DC1, or LON-SVR1 virtual machine.

## Task 1: Working with the Windows eventlog
1. Run this command to list all event logs: ```Get-Eventlog -List```
1. Notice the System Log.
1. Run this command to view the System log: ```Get-Eventlog -LogName system```
1. Run this command to view the latest 20 messages from the System log:
1. ```Get-Eventlog -LogName system -Newest 20```
1. Run this command to view the latest 20 **errors** from the System log:
1. ```Get-Eventlog -LogName system -Newest 20 -EntryType Error```
1. You can write to the eventlog, also.
1. Create a new eventlog with a new source: ```New-EventLog -LogName Tooling -Source Source1```
1. Write an informational message to the new eventlog:
1. ```Write-EventLog -LogName Tooling -Source Source1 -EntryType Information -Message 'startup' -EventId 1000```


## Task 2: Basic networking
1. ```Test-Connection LON-DC1, LON-SVR1```
1. ```Get-NetIPConfiguration```


## Task 3: Software installation
1. Run this command to list all available features: ```Get-WindowsFeature```
1. Run this command to list features with the name telnet: ```Get-WindowsFeature *telnet*```
1. Notice the Name Column. We need these exact names for installation.
1. Run this command to install the telnet client software: ```Install-WindowsFeature Telnet-Client```
1. Notice the Success and Restart Needed columns.
1. Verify the installation of telnet: ```Get-WindowsFeature Telnet-Client```


## Task 4: Install a web server
1. ```Install-WindowsFeature Web-Server```
1. ```mkdir c:\MyWebsite```
1. ```New-WebSite PowerShellSchool -PhysicalPath C:\MyWebsite```


## Task 5: Disk Management
1. Run this command to list all disks: ```Get-Disk```
1. Run this command to list all volumes: ```Get-Volume```
1. Run this command to resize the E:-volume: ```Resize-Partition -DriveLetter E -Size 20GB```
1. Create a new partition on the disk:
1. ```New-Partition -DiskNumber 1 -UseMaximumSize -AssignDriveLetter```
1. A "Format disk" popup might appear. Click Cancel.
1. Notice the driveletter in the output. Also notice that OperationalStatus is still Unknown.
1. Format the volume with NTFS using this command (replace the Z: with the new letter): ```Format-Volume -DriveLetter Z:```
1. Open the Windows Explorer with this command: ```Explorer.exe```
1. Verify the new drive you just created.

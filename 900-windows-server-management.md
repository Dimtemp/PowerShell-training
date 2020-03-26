# Windows Server Management

## Working with the eventlog
1. Run this command to list all event logs: ```Get-Eventlog -List```
1. Run this command to view the System log: ```Get-Eventlog -LogName system```
1. Run this command to view the latest 20 messages from the System log:
1. ```Get-Eventlog -LogName system -Newest 20```
1. Run this command to view the latest 20 **errors** from the System log:
1. ```Get-Eventlog -LogName system -Newest 20 -EntryType Error```
1. You can write to the eventlog, also.
1. Create a new eventlog with a new source: ```New-EventLog -LogName Tooling -Source Source1```
1. Write an informational message to the new eventlog:
1. ```Write-EventLog -LogName Tooling -Source Source1 -EntryType Information -Message 'startup' -EventId 1000```


## Software installation
1. This command only works on Windows servers. Make sure you're logged on to the LON-DC1, or LON-SVR1 virtual machine
1. Run this command to list all available features: ```Get-WindowsFeature```
1. Run this command to list features with the name telnet: ```Get-WindowsFeature *telnet*```
1. Run this command to install the telnet client software: ```Install-WindowsFeature Telnet-Client```
1. Notice the outcome.
1. Verify the installation of telnet: ```Get-WindowsFeature Telnet-Client```


## Disk Management
1. Run this command to list all disks: ```Get-Disk```
1. Run this command to list all volumes: ```Get-Volume```
1. Run this command to create a new folder: ```mkdir C:\VHD
1. Run this command to create a new virtual disk (VHD):
1. ```New-VHD -Path C:\VHD\Disk1.vhd -SizeBytes 8GB -Dynamic```
1. Mount the new VHD: ```Mount-VHD C:\VHD\Disk1.VHD -Passthru```
1. Notice the Number on the bottom, probably a 1.
1. Initialize the disk. Replace the 9 with the number you found in the previous step:
1. ```Initialize-Disk -Number 9 -Passthru```
1. Create a new partition on the disk. Replace the 9 with the number you found previously:
1. ```New-Partition -DiskNumber 9 -UseMaximumSize -AssignDriveLetter```
1. A "Format disk" popup might appear. Click Cancel.
1. Notice the driveletter in the output. Also notice that OperationalStatus is still Unknown.
1. Format the volume with NTFS using this command: ```Format-Volume -DriveLetter D:```
1. Open the Windows Explorer with this command: ```Explorer.exe```
1. Verify the new drive you just created.
1. To create a new virtual disk, initialize it, create a partition and format it, use this command:
1. ```New-VHD -Path C:\VHD\Disk2.VHD -SizeBytes 8GB -Dynamic | Mount-VHD -Passthru | Initialize-Disk -Passthru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume```
1. You don't need to specifiy disks or partitions because we rely on the pipeline to pass the new object information. Some command's don't pass information by default. That's what the Passthru parameter is for.


## Basic networking
1. Make sure you're connected to LON-SVR1
1. ```Test-Connection LON-DC1```
1. ```Get-NetIPConfiguration```


## Install a web server
1. ```Install-WindowsFeature Web-Server```
1. ```mkdir c:\MyWebsite```
1. ```New-WebSite PowerShellSchool -PhysicalPath C:\MyWebsite```


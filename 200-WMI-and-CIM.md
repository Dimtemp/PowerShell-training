# WMI and CIM

**Before performing this exercise you need to have a Windows computer, and have learned how to work with Get-Member and variables.**

WMI stands for Windows Management Instrumenation. So it's an **instrument**, for the **management** of **Windows** computers. It's also meant to manage the largest computer networks.

WMI was introduced in **Windows 95**. That was in 1995. So a long time ago. That's the biggest advantage of WMI: it's part of all Windows operating systems since 1995. It's still part of Windows Server 2019 and Windows 10.


## Task 1: Working with WMI
1. Run this command: ```Get-WmiObject win32_bios```
1. This displays BIOS information.
1. Run this command: ```Get-WmiObject win32_computersystem```
1. Amongst other things, this displays the total amount of physical memory, in bytes.
1. Run this command: ```Get-WmiObject win32_operatingsystem```
1. Notice the BuildNumber and the Version.
1. Run this command: ```Get-WmiObject -List```
1. This command lists all possible WMI classes we can query. The previous three are part of the (huge) list.
1. Run this command: ```Get-WmiObject –List –Class *disk*```
1. This command lists all possible WMI classes that cover disks.
1. Run this command to display local disk info: ```Get-WmiObject Win32_LogicalDisk```
1. Inspect hidden properties: ```Get-WmiObject Win32_LogicalDisk | Get-Member```
1. Create an overview of disks using the following command:
1.  ```Get-WmiObject -class Win32_LogicalDisk | Select-Object PSComputerName, Name, Compressed, Description, FileSystem, @{Name='FreeSpace(G)'; Expression={[int]($_.FreeSpace/1GB)}}, @{Name='Size(G)'; Expression={[int]($_.Size/1GB)}}```
1. Now export the results to HTML:
1.  ```Get-WmiObject -class Win32_LogicalDisk | Select-Object PSComputerName, Name, Compressed, Description, FileSystem, @{Name='FreeSpace(G)'; Expression={[int]($_.FreeSpace/1GB)}}, @{Name='Size(G)'; Expression={[int]($_.Size/1GB)}} | ConvertTo-Html -PreContent 'Disk space report' -PostContent (Get-Date) | Out-File $HOME\diskreport.htm```
1. Open the report in your webbrowser using this command: ```Invoke-Item $HOME\diskreport.htm```
1. Many PowerShell commands support a ComputerName parameter. Get-WmiObject has. You might change the previous command, including the PSComputerName paramter as part of the Get-WmiObject command to report on disk space from many computers in the network.


## Task 2: Filtering WMI Objects
1. Run this command: ```Get-WmiObject –Class Win32_Service```
1. This displays all services.
1. Run this command: ```Get-WmiObject –Class Win32_Service | Where-Object Name -LIKE 'Sp*'```
1. This displays a list of all services with a name that starts with Sp. Notice the wildcard character: *.
1. Run this command: ```Get-WmiObject –Class Win32_Service -Filter "Name LIKE 'Sp%'"```
1. Pay special attention to the spelling and punctuation. Also notice the filter. You might expect **Name -LIKE Sp*,** but instead we use **Name LIKE 'Sp%'**. This is because this is a WMI filter, which has it's own language: WMI Query Language (WQL).
1. Remember the PowerShell saying "Filter left, Format right"? Now we're filtering at the source (left).


## Task 3: WMI Methods
For this task you need to run PowerShell elevated. Right click the PowerShell icon, and click **Run as Administrator**. If you're not able to run PowerShell elevated, just skip task 3.
1. Run this command to list a specific service: ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'"```
1. Notice the StartMode: which should be auto.
1. Run this command to change the startmode:
1. ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'" | Invoke-WmiMethod –Name ChangeStartMode –Argument 'Manual'```
1. Pay special attention to the ReturnValue: it should be 0. If it's not, you might be running PowerShell non-elevated. Pay close attention to the instructions at the beginning of task 3 to run PowerShell elevated.
1. You can inspect the service in several ways: ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'"```
1. Or like this: ```Get-Service Spooler | Select-Object Name, StartType```
1. Now return the service to the automatic start mode:
1. ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'" | Invoke-WmiMethod –Name ChangeStartMode –Argument 'Automatic'```


## Task 4: CIM sessions
CIM stands for Common Information Model. It's an open standard that defines how managed elements in an IT environment are represented (source: Wikipedia). It has many of the same goals as WMI, but it's implementation in PowerShell is more modern.
1. Run this command to open a session to a remote computer: ```$s = New-CimSession –ComputerName LON-DC1```
1. Run this command to query WMI information through the session: ```Get-CimInstance –ClassName Win32_OperatingSystem –CimSession $s```
1. Run this command to close the session: ```$s | Remove-CimSession```

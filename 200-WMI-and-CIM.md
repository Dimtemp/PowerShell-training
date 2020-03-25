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
1. Run this command: ```Get-WmiObject Win32_LogicalDisk```


## Task 2: Filtering WMI Objects
1. Run this command: ```Get-WmiObject –Class Win32_Service```
1. This displays all services.
1. Run this command: ```Get-WmiObject –Class Win32_Service -Filter "Name LIKE 'Sp%'"```
1. Pay special attention to the spelling and punctuation. Also notice the alternative filter. You might expect **Name -LIKE Sp*,** but instead we use **Name LIKE 'Sp%'**. This is because this is a WMI filter, which has it's own language: WMI Query Language (WQL).
1. Remember the PowerShell saying "Filter left, Format right"? Now we're filtering at the source.


## Task 3: WMI Methods
1. Run this command to list a specific service: ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'"```
1. Notice the StartMode: which should be auto.
1. Run this command to change the startmode: ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'" | Invoke-WmiMethod –Name ChangeStartMode –Argument 'Manual'```
1. Inspect the service in several ways: ```Get-WmiObject –Class Win32_Service –Filter "Name='Spooler'"```
1. Or like this: ```Get-Service Spooler```
1. Now return the service to the automatic start mode using Set-Service: ```Set-Service Spooler -StartupType Automatic```


## Task 4: CIM sessions
CIM stands for Common Information Model. It's an open standard that defines how managed elements in an IT environment are represented (source: Wikipedia). It has many of the same goals as WMI, but it's implementation in PowerShell is more modern.

1. Run this command to open a session to a remote computer: ```$s = New-CimSession –ComputerName LON-DC1```
1. Run this command to query WMI information through the session: ```Get-CimInstance –ClassName Win32_OperatingSystem –CimSession $s```
1. Run this command to close the session: ```$s | Remove-CimSession```

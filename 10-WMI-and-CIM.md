# WMI and CIM

Requirements: Get-Member.

# Task 1: Working with WMI
1. Get-WmiObject win32_bios
1. Get-WmiObject win32_computersystem
1. Get-WmiObject win32_operatingsystem
1. Get-WmiObject -List
1. Get-WmiObject –List –Class *disk*
1. Get-WmiObject Win32_DiskDrive # ook: Win32_Volume / Win32_SystemPartitions, LogicalDisk: drivetype = 3: fixed disks

# Task: Investigating WMI Objects
1. Run this command: ```Get-Service```
1. Notice the default output. It is a table that consists of three columns: Status, Name and DisplayName. An important property of a service is the account with which the service is running. This is not a part of the default output.
1. Run this command: ```Get-Service | Format-List *```
1. Notice that an account name is still not a part of the output. 
1. Try this command: ```Get-Service | Get-Member```
1. An account name is still not part of the output. We need to find this information somewhere else.
1. Run this command: ```Get-WmiObject –Class Win32_Service```
1. Notice the default output is a list that contains several properties: ExitCode, Name, ProcessId, StartMode, State and Status. There's still nog accountname in the output.
1. Run this command: ```Get-WmiObject –Class Win32_Service | Format-List *```


# Task: Filtering WMI Objects
1. Run this command: ```Get-WmiObject –Class Win32_Service```
1. output
1. -Filter "Name LIKE 'S%'"
1. –Filter "Name='WinRM'" |

1. Invoke-WmiMethod –Name ChangeStartMode –Argument 'Automatic'
1. Get-WmiObject win32_service |
1. where name -eq winrm |
1. invoke-wmimethod -name changestartmode -argument 'automatic'
1. invoke-cimmethod win32_operatingsystem -methodname reboot
1. Get-WmiObject win32_Volume -Computer (gc servers.txt) | Where { $_.drivetype -eq 3 } | select __server, name, freespace

1. $resultaat = gwmi Win32_Volume |
1. where { $_.name –eq "C:\" } |
1. Invoke-WmiMethod DefragAnalysis
1. ReturnValue!
1. if ( $resultaat.DefragRecommended ) { .... | Invoke-WmiMethod Defrag }

# Task: CIM sessions
1. $s = New-CimSession –ComputerName LON-DC1
1. Get-CimInstance –ClassName Win32_OperatingSystem –CimSession $s 
1. $s | Remove-CimSession



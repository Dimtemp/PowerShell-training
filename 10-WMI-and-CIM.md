# WMI and CIM

# Task 1: Working with WMI
1. Get-WmiObject win32_bios
1. Get-WmiObject win32_computersystem
1. Get-WmiObject win32_operatingsystem
1. Get-WmiObject -List
1. Get-WmiObject –List –Class *disk*
1. Get-WmiObject Win32_DiskDrive # ook: Win32_Volume / Win32_SystemPartitions, LogicalDisk: drivetype = 3: fixed disks

# Task: Filtering WMI Objects
1. Get-Service
1. Get-WmiObject –Class Win32_Service
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




Get-WmiObject win32_bios
Get-WmiObject win32_computersystem
Get-WmiObject win32_operatingsystem
Get-WmiObject -List
Get-WmiObject –List –Class *disk*
Get-WmiObject Win32_DiskDrive # ook: Win32_Volume / Win32_SystemPartitions, LogicalDisk: drivetype = 3: fixed disks

# Task: Filtering WMI Objects
Get-Service
Get-WmiObject –Class Win32_Service
-Filter "Name LIKE 'S%'"
–Filter "Name='WinRM'" |

Invoke-WmiMethod –Name ChangeStartMode –Argument 'Automatic'
Get-WmiObject win32_service |
where name -eq winrm |
invoke-wmimethod -name changestartmode -argument 'automatic'
invoke-cimmethod win32_operatingsystem -methodname reboot
Get-WmiObject win32_Volume -Computer (gc servers.txt) | Where { $_.drivetype -eq 3 } | select __server, name, freespace

$resultaat = gwmi Win32_Volume |
where { $_.name –eq "C:\" } |
Invoke-WmiMethod DefragAnalysis
ReturnValue!
if ( $resultaat.DefragRecommended ) { .... | Invoke-WmiMethod Defrag }

# Task: CIM
1. $s = New-CimSession –ComputerName LON-DC1
1. Get-CimInstance –ClassName Win32_OperatingSystem –CimSession $s 
1. $s | Remove-CimSession




Get-ChildItem

md
mkdir
New-Item –Path c:\ –Name zooi –ItemType Directory

New-Item

Get-PSDrive


Task: New drive
New-PSDrive –Name Programs –Root 'C:\Program Files' –PSProvider FileSystem
Get-ChildItem Programs:\
Note: Net USE P: \\Server1\Share1

Task: Registry
New-Item –Path HKCU:\Software –Name Scripts
New-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Run -Name
"Windows PowerShell" –Value
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"



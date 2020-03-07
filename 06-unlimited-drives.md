# Task: basic file processing
1. ```Get-ChildItem```
1. ```md
1. ```mkdir
1. ```New-Item –Path c:\ –Name zooi –ItemType Directory
1. ```New-Item
1. ```Get-PSDrive


# Task: New drive
1. ```New-PSDrive –Name Programs –Root 'C:\Program Files' –PSProvider FileSystem
1. ```Get-ChildItem Programs:\
1. ```Note: Net USE P: \\Server1\Share1

# Task: Registry
1. Note: this only works on Windows.
1. ```New-Item –Path HKCU:\Software –Name Scripts
1. ```New-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Run -Name 'PowerShell' –Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'

# Formatting output, not disks

## Task 1: Format cmdlets
1. Open PowerShell.
1. ```Get-Process```
1. ```Get-Process | Select-Object NPM, PM, Id, ProcessName```
1. ```Get-Process | Select-Object Handles, NPM, PM, Id, ProcessName```
1. ```Get-Process | Select-Object Handles, NPM, PM, Id, ProcessName | Format-Table```
1. ```Get-Process | Select-Object NPM, PM, Id, ProcessName```
1. ```Get-Process | Select-Object NPM, PM, Id, ProcessName | Format-List```
1. ```Get-Process | Format-Wide```

## Task 2: Format operator
1. $v = Get-Volume
1. $v | foreach { If ($drive.SizeRemaining -le 10GB) { $status = "Low" } Else { $status = "OK" }
1. "{0,-5} {1,10:n2} {2,15:n2} {3,-10}" -f $drive.DriveLetter, ($drive.Size/1GB), ($drive.SizeRemaining/1GB), $status }

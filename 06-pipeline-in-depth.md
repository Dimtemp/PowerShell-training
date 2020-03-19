# The PowerShell pipeline, in depth

#### Note: make sure you know how to work with Select-Object before performing this exercise.

## Task 1:
1. Open a PowerShell console.
1. Run this command to start Paint: ```mspaint```
1. MS Paint opens. Return to the PowerShell console, but leave Paint open.
1. Run this command: ```Get-Help stop-process -full```
1. Scroll to the parameters section and find all parameters that accept pipeline input. For example: the Confirm parameter specifies no pipeline input is accepted: ```Accept pipeline input? False```
1. For all parameters that accept pipeline input, notice whether pipeline input is accepted by property name, or by value.
1. Processes can be stopped by their process id. Run this command to get the process id of Paint: ```Get-Process mspaint```
1. Make a note of the process id in the Id column. 
1. stop-process [-id] <id>
1. mspaint
1. stop-process -name mspaint
1. mspaint
1. stop-process -inputopbject $a
1. mspaint
1. get-process mspaint | stop-process

## Task 2
1. Get-ADComputer –Filter * | Test-Connection
1. ERROR
1. Get-ADComputer –Filter * | Select @{n='ComputerName';e={$_.Name}} | Test-Connection
1. Get-ADComputer –Filter * | Foreach { Test-Connection -Computername $_.Name }
1. Test-Connection –Computername (Get-ADComputer –Filter * | Select –Expand Name)

# The PowerShell pipeline, in depth

#### Note: make sure you know how to work with Select-Object before performing this exercise.

## Task 1:
1. mspaint
1. Get-Help stop-process
1. look for Accept pipeline input (ByValue) (ByPropertyName)
1. Get-Help Stop-Process -Parameter *
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

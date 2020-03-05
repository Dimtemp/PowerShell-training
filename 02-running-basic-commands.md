# Running basic commands in PowerShell.

## Task 1: PowerShell version
1. Open PowerShell.
1. Run this command: ```$host```
1. This command displays information that represents the current host program. In this case PowerShell.exe.
1. Run this command: ```Get-Host```
1. This is another way of display the previous information.
1. Run this command: ```$PSVersionTable```
1. This command displays detailed version information about PowerShell and other components you're using at this moment.


## Task 2: Get-Command
1. Run this command: ```Get-Command```
1. This lists all available PowerShell commands on this system.
1. Run this command: ```Get-Command *process*```
1. 

## Task 3: Get-Help
1. Run this command: ```Get-Command```

## Task 4: Aliases
1. Run this command: ```Get-Alias```
1. This displays a listing of all aliases on the system.
1. Run this command: ```Get-Alias dir, cls, copy```
1. This displays aliases for several popular commands that exist in MS-DOS or the classic Command Prompt (cmd.exe).
1. Run this command: ```Get-Alias ls, clear, cp```
1. This displays aliases for several popular commands that exist in Unix and Linux. Notice that several aliases can exist for single PowerShell command's. For example: the Clear-Host command has at least two aliases: cls and clear.
1. Run this command: ```Get-Alias gci, gcm, gm, group, sort, select, ft, fl```
1. This displays aliases for several popular PowerShell commands. Many popular commands that exist natively in PowerShell can also be aliased.

### Note: it is a best practice to use as few aliases as possible. This way script readability is increased.

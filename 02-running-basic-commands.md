# Running basic commands in PowerShell.

## Task 1: PowerShell version
1. Open PowerShell.
1. Run this command: ```$host```
1. This command displays information that represents the current host program. In this case PowerShell.exe. Notice the **Version**.
1. Run this command: ```Get-Host```
1. This is another way of display the previous information.
1. Run this command: ```$PSVersionTable```
1. This command displays detailed version information about PowerShell and other components you're using at this moment. Notice the **PSVersion**.


## Task 2: Get-Command
1. Run this command: ```Get-Command```
1. This lists all available PowerShell commands on this system.
1. Run this command: ```Get-Command *process*```
1. This lists all available PowerShell commands on this system that contain the word **process**.
1. Run this command: ```Get-Command -Verb Stop```
1. This lists all available PowerShell commands on this system that have a verb of **Stop**, for example Stop-Process and Stop-Service.
1. Run this command: ```Get-Verb```
1. This lists all recommended verbs for PowerShell. In other words: all commands should start with one of these verbs.
1. Run this command: ```Get-Command -Noun Process```
1. This lists all commands in PowerShell that have a process noun. In other words: all commands end with **Process**.


## Task 3: Get-Help
1. Run this command: ```Get-Help```
1. This display a list of all help topics
1. Get-Help Get-Process
1. Get-Help Get-Process -ShowWindow
1. Show-Command Get-Process


## Task 4: Inspecting Aliases
1. Run this command: ```Get-Alias```
1. This displays a listing of all aliases on the system.
1. Run this command: ```Get-Alias dir, cls, copy```
1. This displays aliases for several popular commands that exist in MS-DOS or the classic Command Prompt (cmd.exe).
1. Run this command: ```Get-Alias ls, clear, cp```
1. This displays aliases for several popular commands that exist in Unix and Linux. Notice that several aliases can exist for single PowerShell command's. For example: the Clear-Host command has at least two aliases: cls and clear.
1. Run this command: ```Get-Alias gci, gcm, gm, group, sort, select, ft, fl```
1. This displays aliases for several popular PowerShell commands. Many popular commands that exist natively in PowerShell can also be aliased. For example: Get-Process has a gps alias.

### Note: it is a best practice to use as few aliases as possible. This way script readability is increased.


## Task 5: Creating Aliases
1. Run this command: ```New-Alias edit notepad```
1. You now created an alias for the notepad application.
1. Run this command: ```edit```
1. This will start notepad, since that's what the alias is referring to.
1. Close notepad to return to PowerShell.
1. Run this command to close PowerShell: ```exit``` 
1. Now start PowerShell again.
1. Run this command: ```edit```
1. You'll receive an errormessage that this term is not recognized. That's because aliases only exist in memory. In a later exercise we'll learn how to create aliases in a PowerShell profile and 'make the stick'.


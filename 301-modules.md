# PowerShell Modules

## Your first Function
In this chapter we're going to create a PowerShell module.
1. Run this command to get an overview of commands in Powershell: ```Get-Command | Group-Object CommandType```
1. Notice there are a lot of cmdlets and a lot of functions. Cmdlets are PowerShell commands that are written in C#, which is beyond the scope of this exercise.
1. Many commands are functions. Earlier, we created a function that replaced the prompt.
1. Create a new function with this command: ```function motd { 'With great power comes great responsibility' }```
1. Now run the function: ```motd```
1. **With great power comes great responsibility** should be displayed on screen.
1. Motd stands for Message Of The Day, which is a generic UNIX/Linux command.
1. This function exists in memory. Stop PowerShell: ```exit```
1. Open a new PowerShell console.
1. Run the function again, and notice the error message: ```motd```
1. The motd function is not present in memory anymore.


## function in a script file
1. Run this command: ```ise```
1. This opens the built-in script editor.
1. On line 1, create the same function: ```function motd { 'With great power comes great responsibility' }```
1. On line 2, call the function: ```motd```
1. Your script contains two lines. The first line creates the function, the second line calls it.
1. Run the script with the green play button in the toolbar and notice the **With great power comes great responsibility** message.
1. Minimize the ISE to return to the PowerShell console.
1. Run the function in the console: ```motd```
1. Notice the error message. The motd function is not present in the PowerShell console. It's only present in the ISE.
1. Maximize the ISE. Close it and don't save the file.


## Your first module
Modules are primarily stored in folders that are part of a search path. This way, the functions inside the modules can automatically be loaded upon request.
1. Still in the PowerShell console, run this command to inspect the module path: ```$env:PSModulePath```
1. Since it's a string, we can split it: ```$env:PSModulePath.split(';')```
1. At least three locations should be recognizable in the output
1. - C:\Users\Username\Documents\WindowsPowerShell\Modules
1. - C:\Program Files\WindowsPowerShell\Modules
1. - C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
1. Microsoft uses the last folder to store their modules, so this is a no-go for us.
1. You must decide whether to store your module in your Documents folder, or in the Program Files folder. A best practice would be to first store the module in your Documents folder, and then deploy it to other machines' Program Files folder.
1. Create a WindowsPowerShell folder in your documents folder: ```mkdir -Path $home\Documents\WindowsPowerShell```
1. Create a modules folder in your WindowsPowerShell folder: ```mkdir -Path $home\Documents\WindowsPowerShell\Modules```
1. Create a MyFirstModule folder in your modules folder: ```mkdir -Path $home\Documents\WindowsPowerShell\Modules\MyFirstModule```
1. Create a PowerShell module in the last folder: ```notepad $home\Documents\WindowsPowerShell\Modules\MyFirstModule\MyFirstModule.psm1```
1. When notepad runs, anwer Yes to create the file.
1. In Notepad create a function: ```function motd { 'Old programmers never die... They just decompile.' }```
1. Save the file, close Notepad, and return to the PowerShell console.
1. Run the function: ```motd```
1. This should display **Old programmers never die... They just decompile.** on the screen.
1. Run this command: ```Get-Command motd```
1. The motd command should be listed as part of the MyFirstModule module.


## An advanced function
1. Still in the PowerShell console, run this command to start the Integrated Scritpting Environment with your last module file:
1. ```ise $home\Documents\WindowsPowerShell\Modules\MyFirstModule\MyFirstModule.psm1```
1. On line 1 the motd function should be present.
1. Create a new function below line 1:
```
Function Get-DiskSpace {
  Get-WmiObject win32_logicaldisk | Where-Object DriveType -eq 3
}
```
1. Save the file, and minimize the ISE to return to the PowerShell console.
1. Inspect the modules present in memory: ```Get-Module```
1. The MyFirstModule might still be present in memory. Unload it using this command: ```Remove-Module MyFirstModule```
1. We unload the module, because the last version of our module includes a new function. The old version was still present in memory, without the new function.
1. Now run the new function: ```Get-DiskSpace```
1. This should display the local fixed disks.


## Adapt the function to work with remote computers
1. This script doesn't run on remote computers. This is easily fixed, since WMI is a protocol meant to manage large networks.
1. Create a new line between the Function line and the Get-WmiObject line.
1. Write this on that empty line: ```param($ComputerName)```
1. Modify the next line so it's like this: ```Get-WmiObject win32_logicaldisk -ComputerName $ComputerName | Where-Object DriveType -eq 3```
1. Save the file, and minimize the ISE to return to the PowerShell console.
1. Unload the module from memory using this command: ```Remove-Module MyFirstModule```
1. Now run the new function: ```Get-DiskSpace -ComputerName LON-DC1```
1. If everything is correct, the function retrieves disk info from LON-DC1.
1. Run the function without a computername: ```Get-DiskSpace```
1. You receive an error message. This is because we specified no computername. The WmiObject command cannot work with an empty computername. Let's fix this.


## Adapt the function to work with local and remote computers
1. Return to the ISE and change the param line so it looks like this: ```param($ComputerName=$env:COMPUTERNAME)```
1. Change the Get-WmiObject line so it's like this ```Get-WmiObject win32_logicaldisk -ComputerName $ComputerName | Where-Object DriveType -eq 3```
1. You specified a default value if the function is called without a computername. In that case the local computername is used.
1. Save the file, and minimize the ISE to return to the PowerShell console.
1. Unload the module from memory using this command: ```Remove-Module MyFirstModule```
1. Run the function without a computername: ```Get-DiskSpace```
1. If everything is correct, the function retrieves disk info from the local computer.


## Adapt the function to be able to process multiple computers
1. Return to the ISE and change the param line so it looks like this: ```param([string[]]$ComputerName=$env:COMPUTERNAME)```
1. Change the Get-WmiObject line so it's like this:
```
foreach($pc in $computerName) {
  Get-WmiObject win32_logicaldisk -ComputerName $pc | Where-Object DriveType -eq 3
}
```
1. Save the file, and minimize the ISE to return to the PowerShell console.
1. Unload the module from memory using this command: ```Remove-Module MyFirstModule```
1. Run the function with multiple computernames: ```Get-DiskSpace -ComputerName LON-DC1, LON-CL1```
1. If everything is correct, the function retrieves disk info from multiple computers.


## Adapt the function to include help
1. Return to the ISE and create a new line below the function line.
1. Insert a comment block between the function line and the param line:
```
<#
.SYNOPSIS
This command displays disk space on local and remote computers.

.DESCRIPTION
This command uses WMI to list disk size and capacity on local and remote computers.

.EXAMPLE
Get-DiskSpace -ComputerName LON-DC1
This command retrieves disk info from the LON-DC1 computer.
#>
```
1. Save the file, and minimize the ISE to return to the PowerShell console.
1. Unload the module from memory using this command: ```Remove-Module MyFirstModule```
1. Display the help of the function : ```Get-Help Get-DiskSpace```
1. Display the examples of the function : ```Get-Help Get-DiskSpace -Examples```


## Adapt the function to include verbose output using CmdletBinding
1. Return to the ISE and change the param line so it looks like this: ```[cmdletbinding()]param($ComputerName=$env:COMPUTERNAME)```
1. Insert a new line between foreach and Get-WmiObject and insert this line: ```Write-Verbose "Connecting to $pc"```
1. Save the file, and minimize the ISE to return to the PowerShell console.
1. Unload the module from memory using this command: ```Remove-Module MyFirstModule```
1. Run the function verbose: ```Get-DiskSpace -Verbose```
1. If everything is correct, the function retrieves disk info from the local computer, including verbose output.
1. Run the function with multiple computernames: ```Get-DiskSpace -ComputerName LON-DC1, LON-CL1 -Verbose```
1. If everything is correct, the function retrieves disk info from multiple computers, including verbose output.

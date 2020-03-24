# Modules

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
1. Run the function in the console, and notice the error message: ```motd```
1. The motd function is not present in the PowerShell console. It's only present in the ISE.


## Your first module
Modules are primarily stored in folders that are part of a search path. This way, the functions inside the modules can automatically be loaded upon request.
1. Still in the PowerShell console, run this command to inspect the module path: ```$env:PSModulePath```
1. Since it's a string, we can split it: ```$env:PSModulePath.split(';')```
1. At least three locations should be recognizable in the output
1. - C:\Users\Username\Documents\WindowsPowerShell\Modules
1. - C:\Program Files\WindowsPowerShell\Modules
1. - C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
1. Microosft uses the last folder to store their modules, so this is a no-go for us.
1. You must decide whether to store you module in your Documents folder, or in the Program Files. A best practice would be to first store the module in your document folder, and then deploy it to other machines' program files folders.
1. Create a WindowsPowerShell folder in your documents folder: ```mkdir -Path $home\Documents\WindowsPowerShell```
1. Create a modules folder in your WindowsPowerShell folder: ```mkdir -Path $home\Documents\WindowsPowerShell\modules```
1. Create a MyFirstModule folder in your modules folder: ```mkdir -Path $home\Documents\WindowsPowerShell\modules\MyFirstModule```
1. Create a PowerShell module the last folder: ```notepad $home\Documents\WindowsPowerShell\modules\MyFirstModule\MyFirstModule.psm1```
1. When notepad runs, anwer Yes to create the file.
1. In Notepad create a function: ```function motd { 'With great power comes great responsibility' }```
1. Save the file, and return to the PowerShell console.
1. Run the function.

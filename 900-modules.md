# Modules

## Your first Function
In this chapter we're going to create a PowerShell module.
1. Run this command to get an overview of commands in Powershell: ```Get-Command | Group-Object CommandType```
1. Notice there are a lot of cmdlets and a lot of functions. Cmdlets are PowerShell commands that are written in C#, which is beyond the scope of this exercise.
1. Many commands are functions. Earlier, we created a function that replaced the prompt.
1. Create a new function with this command: ```function motd { 'Welcome!' }```
1. Now run the function: ```motd```
1. **Welcome!** should be displayed on screen.
1. Motd stands for Message Of The Day, which is a generic UNIX/Linux command.
1. This function exists in memory. Stop PowerShell: ```exit```
1. Open a new PowerShell console.
1. Run the function again, and notice the error message: ```motd```
1. The motd function is not present in memory anymore.


## function in a script file
1. Run this command: ```ise```
1. This opens the built-in script editor.
1. On line 1, create the same function: ```function motd { 'Welcome!' }```
1. On line 2, call the function: ```motd```
1. Your script contains two lines. The first line creates the function, the second line calls it.
1. Run the script with the green play button in the toolbar and notice the **Welcome** message.
1. Minimize the ISE to return to the PowerShell console.
1. Run the function in the console, and notice the error message: ```motd```
1. The motd function is not present in the PowerShell console. It's only present in the ISE.

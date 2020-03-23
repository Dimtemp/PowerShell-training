# The PowerShell pipeline, in depth

#### Note: make sure you know how to work with Select-Object before performing this exercise.

#### Note: as with most PowerShell exercises, it's best not to copy-paste the command's, but to actually type them. Use keyboard navigation (arrow up/down, home, end) to speed up entering commands in PowerShell.

#### Note: make sure you are working with a computer that has the Active Directory PowerShell module installed. In the lab environment, we work with the LON-CL1 virtual machine.

## Task 1: pipeline binding, in depth
1. Open a PowerShell console.
1. Run this command to determine any Paint process that might be running: ```Get-Process mspaint```
1. If this command results in an errormessage that it cannot find a process with the name "Paint": **that's good!**
1. If there are any Paint processes running, close them by hand now, since we will stop the Paint process **a lot.**
1. Do not continue with the next step if there are any Paint processes still running.
1. Run this command to start Paint: ```mspaint.exe```
1. MS Paint opens. Return to the PowerShell console, but leave Paint open.
1. Run this command: ```Get-Help stop-process -full```
1. Scroll to the parameters section and find all parameters that accept pipeline input. For example: the Confirm parameter specifies no pipeline input is accepted: ```Accept pipeline input? False```
1. For all parameters that accept pipeline input, notice whether pipeline input is accepted by property name, or by value.
1. Processes can be stopped by their process id. Run this command to get the process id of Paint: ```Get-Process mspaint```
1. Make a note of the process id in the Id column. 
1. Run this command, replacing 1234 with the Id that you noted down in the previous step: ```Stop-Process -id 1234```
1. If you entered the process id correctly then the Paint application should have been stopped. Confirm there is no Paint application running anymore.
1. Run this command to start Paint again: ```mspaint.exe```
1. Run this command to stop the Paint process by name: ```Stop-Process -Name mspaint```
1. The Paint application has been stopped by referring it's name.
1. If there are multiple processes running with the same name, they will be stopped by a single command.
1. Run this command to start Paint once more: ```mspaint.exe```
1. Now stop the Paint application like this: ```Get-Process mspaint | Stop-Process```
1. You stopped the Paint application by retrieving it with a Get-Process command, and then piping the output to the Stop-Process command. Since the output is in the <Process>-form, the output will bind to the input parameter InputObject, because that's the form that is expected.


## Task 2: pipline binding, in depth and advanced
For this task you will need at least two computers. We're using a domain controller with the name LON-DC1 and a Windows 10 computer with the name LON-CL1. If you want to use other computernames that's ok. Just replace the names with your computernames. Make sure you're performing this exercise from the client computer: LON-CL1.
1. Retrieve all computers from Active Directory with this command: ```Get-ADComputer –Filter *```
1. Send a ping to the domain controller with this command: ```ping LON-DC1```
1. Ping was introduced in 1983, so that's a very old command. Now send a ping using a proper PowerShell command: ```Test-Connection LON-DC1```
1. Notice the similarity in the output. Both commands send four pings, with one second intervals. The first command (ping) is a operating system utility, so the output is text only. The second command is a native PowerShell command, so it's output is more flexbile. Always try to use native PowerShell commands, instead of operating system utilities.
1. Now that you retrieved computers from Active Directory, and you have sent pings to computers on the network, let's try to use them together in a single command.
1. Run this command: ```Get-ADComputer –Filter * | Test-Connection```
1. This will result in several error messages. This is either because the Test-Connection command does not accept pipeline input, or the output is not in the correct format. You already saw at the beginning of this exercise that Get-ADComputer is producing output, so let's investigate what is going wrong.
1. First, run this command to determine whether Test-Connection is accepting pipeline input, and in what format it's supposed to be: ```Get-Help Test-Connection -full```
1. Scroll to the PARAMETERS section. Note any parameters that accept pipeline input. Focus on the line that reads "Accept pipeline input?" for each parameter. 
1. If everything is correct there is only one parameter that accepts pipeline input: **ComputerName <String[]>**. It specifies: **Accept pipeline input?  True (ByPropertyName)**
1. This means that output needs to include a parameter


## Task 3: solving pipeline problems.
  - Many errors in PowerShell are pipeline related. It's important that you're becoming fluent in handling these errors.
  - There are generally four solutions to the problem in the previous task. There is no best solution. It's mostly personal preference. There is however a worst solution. Let's find out.

### Solution 1: manually editing a file
1. Run this command: ```Get-ADComputer –Filter * | Export-Csv computers.csv```
1. Now open the file for editing with this command: ```Notepad computers.csv```
1. Replace DnsHostName with ComuterName in the header of the file.
1. Save the file and return to the PowerShell console.
1. Run this command to send the ping: ```Import-Csv computers.csv | Test-Connection```
1. The ping should be sent to the computers in the csv file successfully.
1. Since this method involves editing a file by hand, it's not appropriate for running this command unattended, for example when running a nightly job. This would be the worst solution.

### Solution 2: using Select-Object
1. With Select-Object command you can influence the output. In this case, we're going to create a new property with the name ComputerName. That name is accepted by Test-Connection.
1. Run this command to inspect the output: ```Get-ADComputer –Filter *```
1. Notice the Name property.
1. Run this command to create output that displays a ComputerName property. The source of the data is the Name property of the Active Directory output.
1. ```Get-ADComputer –Filter * | Select-Object @{name='ComputerName';expression={$_.Name}}```
1. Notice that the only output includes a ComuterName property. This is accepted by the Test-Connection command.
1. Run this command to pipe the output of Select-Object to Test-Connection:
1. ```Get-ADComputer –Filter * | Select-Object @{name='ComputerName';expression={$_.Name}} | Test-Connection```
1. Notice that the command is working.

### Solution 3: using Foreach-Object
1. With the Foreach-Object command you can process any output. This command is the most flexible.
1. Run this command: ```Get-ADComputer –Filter *```
1. The output will display all objects from Active Directory. We call this 'rich' output. Including all metadata.
1. Run this command: ```Get-ADComputer –Filter * | Foreach-Object { Write-Host $_.Name }```
1. The Write-Host command writes the names of the three computer objects from Active Directory to the screen. There is no header, no metadata. Just the computername without any context.
1. Instead of writing the output to the screen, we want the output to be used as input for Test-Connection. Let's do this next.
1. Run this command: ```Get-ADComputer –Filter * | Foreach-Object { Test-Connection -Computername $_.Name }```
1. Notice that the command is working.

### Solution 4: Please Excuse My Dear Aunt Sally (or "Hoe moeten wij van de onvoldoendes afkomen" in Dutch, my native language)
1. Run this command: ```Get-ADComputer –Filter *```
1. The output will display all objects from Active Directory.
1. Now pipe the output to Select-Object to select the Name property as the only property to be shown in the output: ```Get-ADComputer –Filter * | Select-Object Name```
1. The output still contains a header (metadata), which is not desirable for our solution.
1. Use the ExpandProperty parameter from Select-Object to get rid of the metadata: ```Get-ADComputer –Filter * | Select-Object -ExpandProperty Name```
1. The output displays computernames from Active Directory. There is no header/metadata.
1. Now use parenthesis as input for the ComputerName parameter of TestConnection.
1. ```Test-Connection –Computername (Get-ADComputer –Filter * | Select-Object –ExpandProperty Name)```
1. Notice that the command is working.

## Summary
There are basically three solutions in case a command does not accept, or cannot process, pipeline input.
### Using Select-Object
1. ```Get-ADComputer –Filter * | Select-Object @{name='ComputerName';expression={$_.Name}} | Test-Connection```
### Using Foreach-Object
1. ```Get-ADComputer –Filter * | Foreach-Object { Test-Connection -Computername $_.Name }```
### Using parenthesis
1. ```Test-Connection –Computername (Get-ADComputer –Filter * | Select-Object –ExpandProperty Name)```

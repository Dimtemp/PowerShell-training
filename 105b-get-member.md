# Diving deeper with Get-Member

## Task x: Diving into processes
1. Start a new application in the PowerShell window by typing this command: ```mspaint.exe```
1. Retrieve a list of processes with the name **mspaint** by entering this command: ```Get-Process mspaint```
1. The output should display information on one or more mspaint processes. It displays the **ProcessName, ID, Handles, NPM,** etc...
1. Run this command to retrieve extra information on the mspaint processes in general: ```Get-Process mspaint | Get-Member```
1. This displays information on processes in general.
1. Scroll up to the start of the output. It should display **TypeName: System.Diagnostics.Process**
1. This is the **type of object** that was the input for Get-Member.
1. Investigate the list and focus on the **MemberType** column. It should display different types: **AliasProperty, Method** and **Property** are the most popular ones.
1. Some properties were already in the output. You should be able to find **Id** and **ProcessName** as properties.
1. Some properties have been aliased. For example, **NPM** is an alias for **NonpagedSystemMemorySize64**. You can imagine that the process listing would be very wide if some original property names are being used. This might be a reason to alias a property to a shorter name.


## Task x: Using methods
1. Retrieve a list of processes with the name **mspaint** by entering this command: ```Get-Process mspaint```
1. Assuming you still have one mspaint process running, run this command: ```Get-Process mspaint | ```

1. Make sure there is only one mspaint process. The process you started before. If there are more mspaint processes, try to close them.
1. **Do not continue beyond this point of there is not just 1 mspaint process.**
$proc.kill()


## Task x: Diving into datetime objects
datetime

## Task 1: Diving into string objects 

string






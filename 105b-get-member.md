# Diving deeper with Get-Member
In this chapter we're going to investigate objects and their output. The Get-Member command will help us with that. Notice that while Get-Member is a command that can help us to determine object or output specifics, it's hardly ever used in a script. In other words: use Get-Member to investigate and learn how things works. After that, you can apply what you've learned in a script.

## Task 1: Diving into string objects
1. Enter this command to display a simple message: ```'hello, world'```
1. Please notice we use **single quotation marks** to specify we're creating a **string object**.
1. Also notice we don't use a CmdLet or Function (like **Write-Host** or **echo**) to display the output on the screen.
1. Run this command to investigate the output: ```'hello, world' | Get-Member```
1. This displays information on **string objects** in general.
1. Scroll up to the start of the output. It should display **TypeName: System.String**. This is the **type of object** that was the input for Get-Member.
1. Investigate the list and focus on the **MemberType** column. It should display **Method** many times, and on the bottom just one **Property**.
1. Run this command to display the length of the string: ```'hello, world'.Length```
1. It should display 12 as the length of the string.
1. OOPS! :see_no_evil: This is our first formal encounter with Object-Oriented Programming (OOP). Please notice the dot (.) character. It's the separation between the object on the left, and it's properties and methods on the right. This is a very common notation in other programming languages also, like C, Java, and Python. You will see this notation a lot in PowerShell, also.
1. This OOP-notation: 'hello, world'.Length, means we want to **view** the **Length** property of the string object.


## Task 2: Methods
In OOP-programming, objects can have properties and methods. Methods can be seen as macros from a Word document. Macros execute functions within a document. Methods can be explained as mini-programs, executing on the objects data.
1. Run this command to split the string on whitespace: ```'hello, world'.Split()```
1. It should display both words on two different lines.
1. This OOP-notation: 'hello, world'.Split(), means we want to **execute** the **Split** method of the string object.
1. Run this command to split the string on a dash: ```'31-12-2020'.Split('-')```
1. It should display the numbers 30, 12, and 2020 on three different lines.
1. Run this command to convert the string to upper case: ```'hello, world'.ToUpper()```
1. Run this command to replace the word **world** with **dear**: ```'hello, world'.Replace('world', 'dear')```
1. Run this command to display a part of the string: ```'hello, world'.Substring(7,5)```
1. Using this command you can determine what parameters are accepted by the **Substring** method: ```'hello, world'.Substring``` Notice the **lack** of parentheses **()** at the end of the mehod name.
1. The output should tell you that Substring can accept two parameters: **startIndex** and **length**, and that both are of type **int** (integer).


## Task 3: Diving into processes
1. Start a new application in the PowerShell window by typing this command: ```mspaint```
1. Retrieve a list of processes with the name **mspaint** by entering this command: ```Get-Process mspaint```
1. The output should display information on one or more mspaint processes. It displays **Handles, NPM, ID, ProcessName** and several other properties.
1. Run this command to retrieve extra information on the mspaint processes in general: ```Get-Process mspaint | Get-Member```
1. This displays information on **process objects** in general.
1. Scroll up to the start of the output. It should display **TypeName: System.Diagnostics.Process**. This is the **type of object** that was the input for Get-Member.
1. Investigate the list and focus on the **MemberType** column. It should display different types: **AliasProperty, Method** and **Property** are the most popular ones.
1. Some properties were already in the output of **Get-Process**. You should be able to find **Id** and **ProcessName** as properties.
1. Some properties were not in the output, but are part of the object. PowerShell might decide not to show those properties to keep the output simple. Notice the **Path** and **Company** properties.
1. Use Select-Object to display proerties that were hidden: ```Get-Process | Select-Object ProcessName, Company, Path```
1. Some properties have been aliased. For example, **NPM** is an alias for **NonpagedSystemMemorySize64**. You can imagine that the process listing would be very wide if some original property names are being used. This can be a reason to alias a property to a shorter name.


## Task 4: Killing a process using a method
1. Retrieve a list of processes with the name **mspaint** by entering this command: ```Get-Process mspaint```
1. Make sure there is only one mspaint process: the process you started before. If there are more mspaint processes, try to close them until there is one left.
1. **Do not continue beyond this point if there is not just 1 mspaint process.**
1. Run this command to retrieve extra information on the mspaint processes in general: ```Get-Process mspaint | Get-Member```
1. Find the **methods** in the **MemberType** column.
1. Make sure the is a **Kill** method. The kill method stops a process. We will stop our single mspaint process.
1. Assuming you have one mspaint process running, run this command: ```(Get-Process mspaint).Kill()```
1. In the previous command you enclose the ```Get-Process mspaint``` command in parentheses to help PowerShell distinguish the object from the method. Imagine this command: ```Get-Process mspaint.Kill()```. If you would run the previous command, it would result in an error message. With the first set of parentheses we help PowerShell in distinguishing between the object **(Get-Process mspaint)** and the method **Kill**.


## Task x: Diving into datetime objects
1. $CurrentDate = Get-Date
1. $CurrentDate | Get-Member
1. $CurrentDate.DayOfWeek
1. $CurrentDate.Month
1. $CurrentDate.AddDays(28)
1. Verify in your calendar that the result of the last command is correct.


## Task x: using variables
1. $MyProc = get-process mspaint
1. $MyProc
1. $MyProc.Id
1. $MyProc.Path
1. $MyProc.kill()
1. $CurrentDate = Get-Date
1. $CurrentDate | Get-Member
1. $CurrentDate.DayOfWeek
1. $CurrentDate.Month
1. $CurrentDate.AddDays(28)
1. Verify in your calendar that the result of the last command is correct.

# .NET framework

## Performing math
PowerShell has no reference of Pi, or cannot perform some popular math functions. We can use the .NET framework for this.
1. Run this command to convert a negative number to positive: ```[Math]::Abs(-50)```
1. Run this command to display the Pi constant: ```[Math]::Pi```


## String handling
1. Create a string object using this command: ```"Hello world"```
1. Inspect the object using Get-Member: ```"Hello world" | Get-Member```
1. Notice the Type on top. It should display: "TypeName: System.String". This refers to the String class in the System namespace of the .NET framework.
1. Notice the Length property. Inspect it using this command: ```"Hello world".Length```
1. It should be 11.
1. Make the string a bit longer and inspect the length again: ```"Hello everybody".Length```
1. Now it should be 15 characters long.
1. Inspect the first string object again using Get-Member: ```"Hello world" | Get-Member```
1. Notice the methods. Some are very popular, like Replace, Split, Substring.
1. Split the string using the method with the same name: ```"Hello world".split()```
1. Notice that methods are invoked using paranthesis () at the end of the method name.
1. Also notice the method splits on space by default.
1. Run this command to split the string on the letter 'o': ```"Hello world".split('o')```
1. Replace 'world' with 'friend' using the Replace method: ```"Hello world".Replace('world', 'friend')```
1. Extract a part of the string using the substring method: ```"Hello world".Substring(6, 5)```
1. In the previous command 6 refers to the startIndex, and 5 refers to the length of the requested substring.


## Kill a Process using the .NET framework
1. Make sure you don't run a Paint process: ```Get-Process -Name mspaint```
1. Before you continue, make sure you close all running paint processes to prevent data loss.
1. Start mspaint: ```mspaint```
1. Retrieve the mspaint process and store it in a variable: ```$p = Get-Process -Name mspaint```
1. Inspect the variable: ```$p```
1. Make sure it only contains a single mspaint process. If not, close, and optionally save, all mspaint processes.
1. Inspect the variable using Get-Member: ```$p | Get-Member```
1. Notice the Type on top. It should display: "TypeName: System.Diagnostics.Process". This refers to the Process class in the System.Diagnostics namespace of the .NET framework.
1. Also notice the kill method. Run this command to kill the process: ```$p.Kill()```

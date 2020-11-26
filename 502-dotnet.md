# .NET framework

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
1. Retrieve the mspaint process and store it in a variable: ```$p = Get-Process mspaint```
# Retrieve a reference to the instance of System.Diagnostics.Process
$p | get-member
$p.name
$p.kill()   # same: Stop-Process -name mspaint


## Inspecting environment variables
env var

## Performing math
math abs

# Formatting output, not disks

## Task 1: Format cmdlets
1. Open a PowerShell console.
1. Run this command: ```Get-Process```
1. Notice the default table output.
1. Run this command: ```Get-Process | Select-Object NPM, PM, Id, ProcessName```
1. Notice the table output. You have selected four properties.
1. Run this command: ```Get-Process | Select-Object Handles, NPM, PM, Id, ProcessName```
1. Notice the default list output, instead of table. That's because you have selected five properties. If you're selecting five or more properties, the default output is a list instead of a table.
1. Run this command: ```Get-Process | Select-Object Handles, NPM, PM, Id, ProcessName | Format-Table```
1. Now it's a table again. With any number of properties you can ask PowerShell to format it like a table.
1. Run this command: ```Get-Process | Select-Object Handles, NPM, PM, Id, ProcessName | Format-Table | Sort-Object Handles```
1. The previous command doesn't sort on the Handles column. That's because a Format-command should always be on the most righthand side.
1. Try it like this: ```Get-Process | Select-Object Handles, NPM, PM, Id, ProcessName | Sort-Object Handles | Format-Table```
1. Now you get a proper table, containing five properties, and sorted on Handles.
1. Run this command: ```Get-Process | Select-Object NPM, PM, Id, ProcessName```
1. The result is a four-column table, like we had before. From one to four properties the default output is a table.
1. Now, run this command: ```Get-Process | Select-Object NPM, PM, Id, ProcessName | Format-List```
1. The result is a list containing four properties per item (object).

You can convert any table into a list, or any list into a table. Beware that you cannot sort on (or process) output as soon as you format the output as a list or a table. That's why all Format commands should be on the righthand side.


## Task 2: writing to the screen
1. Run this command: ```Write-Host 'Goodmorning'```
1. This writes Goodmorning to the screen.
1. Run this command: ```Write-Host 'Goodmorning' -ForeGroundColor red```
1. Notice the red color.
1. Run this command: ```Write-Host 'Goodmorning' -ForegroundColor red -BackgroundColor black```
1. Using Write-Host you can write to the screen, and set colors to do so.
1. Run this command: ```Write-Host 'Goodmorning' -ForegroundColor red -BackgroundColor black | Out-File test.txt```
1. Notice the output on the screen.
1. List the file with this command: ```Get-ChildItem test.txt```
1. Open the file with notepad: ```notepad test.txt```
1. Notice the file is empty. This is because Write-Host is writing to the hosting environment, which is the console window.
1. Run this command: ```'Goodmorning'```
1. Notice we're not relying on Write-Host to write Goodmorning to the screen. We're just generating a (text) string, that's is displayed on screen by default.
1. Run this command: ```'Goodmorning' | Out-File test.txt```
1. Notice the lack of output on the screen.
1. Now inspect the file with this command: ```Get-ChildItem test.txt```
1. Open the file with notepad: ```notepad test.txt```
1. Notice Goodmorning is written to the text file.
1. Writing to files is discussed more in-depth in a later chapter.


## Task 2: Format operator
The format operator can do some advanced formatting. It's used regularly to make things more human readable.
1. Run this command: ```'number of bytes free: 3485872643'```
1. Notice the lack of a Write-Host command. Again, we're just generating a (text) string, that's is displayed on screen by default. Since we have a number with many digits it's hard to tell how many megabytes or gigabytes are still free.
1. Run this command: ```'number of bytes free: {0}' -f 3485872643```
1. Notice the output hasn't changed, bu the command has changed significantly. The {0} is referring to the first parameter after the -f operator.
1. Run this command: ```'number of bytes free: {0:N}' -f 3485872643```
1. Now we're formatting the output as a numeric, which means we include extra punctiation.
1. Run this command: ```'number of bytes free: {0:N0}' -f 3485872643```
1. Notice the special notation between brackets: **0:N0**. We're still formatting the output as a numeric, but in this case we limit the number of trialing zeros to none.


## Task 3: handling Strings
1. Run this command: ```Write-Host 'Greetings'```
1. Greetings is displayed on the screen. We don't need Write-Host to display a message. When we're processing strings, it's not always meant to be written to the screen.
1. Run the command again, without the Write-Host command: ```'Greetings'```
1. A string object contains one property and a lot of methods. Pipe the string to Get-Member to inspect: ```'Greetings' | Get-Member```
1. Notice the Length property of the string object. Run this command to inspect the length property: ```'Greetings'.length```
1. The result should be 9.
1. Scroll back and notice there are many methods present on a string object. Let's try a few.
1. Run this command to convert the string to upper case: ```'Greetings'.ToUpper()```
1. Run this command to convert the string to lower case: ```'Greetings'.ToLower()```
1. Run this command to replace a section of the string: ```'Greetings'.Replace('ings','ed')```
1. Greeted should be displayed.
1. Methods can be nested. Run this command to replace a section of the string AND convert it to upper case: ```'Greetings'.Replace('ings','ed').ToUpper()```
1. Another method is split. Run it to split a string on space: ```'server1 server2 server3'.split()```
1. You can split on other characters as well: ```'user1@company.com;user2@company.com'.split(';')```
1. Use the substring method to display a portion of the string: ```'Greetings'.Substring(5,3)```
1. This displays the sixth through the eighth characters.
The first character starts at 0. This command displays the first two characters: ```'Greetings'.Substring(0,2)```
1. True or False, depending on whether the string starts with the value G.
1. Run this command: ```'Greetings'.StartsWith('G')```
1. Should be true.
1. Run this command: ```'Greetings'.StartsWith('K')```
1. Should return false.
1. Run this command: ```'Greetings'.PadLeft(15)```
1. The left of the output is padded with spaces so the total length will be 15.

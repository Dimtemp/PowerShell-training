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
1. Run this command: ```Write-Host 'Goodmorning -ForeGroundColor red'```
1. Notice the red color.
1. Run this command: ```Write-Host 'Goodmorning -ForegroundColor red -BackgroundColor black'```
1. Using Write-Host you can write to the screen, and set colors to do so.
1. Run this command: ```Write-Host 'Goodmorning -ForegroundColor red -BackgroundColor black' | OutFile test.txt```
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
The format operator can do some advanced formatting. It's used regularly to maken things more human readable.
1. Run this command: ```'number of bytes free: 3485872643'```
1. Notice the lack of a Write-Host command. Again, we're just generating a (text) string, that's is displayed on screen by default. Since we have a number with many digits it's hard to tell how many megabytes or gigabytes are still free.
1. Run this command: ```'number of bytes free: {0}' -f 3485872643```
1. Notice the output hasn't changed, bu the command has changed significantly. The {0} is referring to the first parameter after the -f operator.
1. Run this command: ```'number of bytes free: {0:N}' -f 3485872643```
1. Now we're formatting the output as a numeric, which means we include extra punctiation.
1. Run this command: ```'number of bytes free: {0:N0}' -f 3485872643```
1. Notice the special notation between brackets: **0:N0**. We're still formatting the output as a numeric, but in this case we limit the number of trialing zeros to none.


## Task 3: handling Strings
1. Write-Host "Greetings"
1. "Greetings".ToUpper()
1. "Greetings".ToLower()
1. "Greetings".Replace('ings','ed').ToUpper()
1. "server1 server2 server3".split()
1. Display the sixth through the eighth characters
1. "Greetings".Substring(5,3)
1. "Greetings".Length
1. True or False, depending on whether the string starts with the value G.
1. "Greetings".StartsWith('G')
1. "Greetings".PadLeft(10)

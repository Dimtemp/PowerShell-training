# Call operator
The call operator, also known as the "invocation operator", lets you run commands that are stored in variables and represented by strings or script blocks.

This example stores a command in a string and executes it using the call operator.
```
PS> $c = "get-executionpolicy"
PS> $c
get-executionpolicy
PS> & $c
AllSigned
```
The call operator does not parse strings. This means that you cannot use command parameters within a string when you use the call operator.
```
PS> $c = "Get-Service -Name Spooler"
PS> $c
Get-Service -Name Spooler
PS> & $c
& : The term 'Get-Service -Name Spooler' is not recognized as the name of a
cmdlet, function, script file, or operable program. Check the spelling of
the name, or if a path was included, verify that the path is correct and
try again.
```


# Invoke-Expression
The Invoke-Expression cmdlet can execute code that causes parsing errors when using the call operator.
```
PS> $c = "Get-Service -Name Spooler"
PS> $c
Get-Service -Name Spooler
PS> Invoke-Expression $c

Status   Name               DisplayName
------   ----               -----------
Running  Spooler            Print Spooler
```

# Start-Process
The Start-Process cmdlet starts one or more processes.

To specify the program that runs in the process, enter an executable file or script file, or a file that can be opened by using a program on the computer. If you specify a non-executable file, Start-Process starts the program that is associated with the file, similar to the Invoke-Item cmdlet.

You can use the parameters of Start-Process to specify options, such as loading a user profile, starting the process in a new window, or using alternate credentials.

This example starts ipconfig.exe, which is in the search path. The command uses all of the default values, including the default window style, working folder, and credentials.

```Start-Process 'ipconfig'```

This example starts the Notepad.exe process. It maximizes the window and retains the window until the process completes.

```Start-Process -FilePath "notepad" -Wait -WindowStyle Maximized```

The next commands start the Windows command interpreter (cmd), issuing a dir command on the Program Files folder. Because this foldername contains a space, the value needs surrounded with escaped quotes. Note that the first command specifies a string as ArgumentList. The second command is a string array.
```
Start-Process -FilePath "$env:comspec" -ArgumentList "/c dir `"%systemdrive%\program files`""
Start-Process -FilePath "$env:comspec" -ArgumentList "/c","dir","`"%systemdrive%\program files`""
```

# Using WMI to start a process
1. Run this command to get a process listing: ```Get-Process```
1. Run this command to get a process listing using WMI: ```Get-WmiObject win32_process```
1. Run this command to get a selected process listing using WMI: ```Get-WmiObject win32_process | Select-Object Handles, WS, ProcessId, ProcessName```
1. Notice the similarities and differences. 
1. Run this command to use the Create method of the win32_process class to start a process: ```Invoke-WmiMethod -Class win32_process -Name create -ArgumentList 'notepad.exe'```
1. Verify that notepad has started.
1. Close notepad.

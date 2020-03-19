# Filtering with and without Where-Object

## Task 1: basic filtering
1. Run this command: ```Get-Process```
1. This displays a list of all running processes. Notice the Handles column.
1. Run this command: ```Get-Process | Where-Object Handles -GT 1000```
1. This displays a list of all running processes that have more than 1000 handles.
1. Run this command: ```Get-Process | Where-Object Handles -LT 1000```
1. This displays a list of all running processes that have less than 1000 handles.
1. Run this command: ```Get-Service```
1. This displays a list of all services.
1. Run this command: ```Get-Service | Where-Object Status -EQ Running```
1. This displays a list of all services that are running.
1. Run this command: ```Get-Service | Where-Object Status -EQ Stopped```
1. This displays a list of all services that are not running.


## Task 2: like this
1. Run this command to display only processes that start with **w**: ```Get-Process | Where-Object name -LIKE w*```
1. This should list several processes with their names starting with a **w**.
1. Run this command to display only processes that have **svc** in their name:
1. ```Get-Process | Where-Object name -LIKE *svc*```
1. Run this command to display only processes that end with **s**:
1. ```Get-Process | Where-Object name -LIKE *s```


## Task 3: match them
PowerShell has an extremely **PowerFull** pattern matching mechanism: regular expressions. Originating not earlier than **1951**, it's a wonderfull way to describe patterns in input and output.
1. Run this command to list all processes that have **sh** in their names: ```Get-Process | Where-Object ProcessName -match sh```
1. Notice that we're not using any wildcards, like * or ?.
1. Run this command to list all services that have **win** in their names: ```Get-Service | Where-Object Name -match win```


1. Note: if you don't get any output, try to use another text until you get a (preferred small) result.
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```


## Task: filtering at the source
The Where-Object has a major advantage: all PowerShell output can be filtered. It also has a huge disadvantage: all output will be filtered locally, by PowerShell. Some commands allow to filter at the source. This can prevent huge data transfers across the network, or can help speed up processing.
1. ```Get-Process -Name *sys*```
1. get-childitem -filter
1. get-wmiobject -filter
1. required filters: Some command's can generate a lot of load. To make the scripter be cautious 
1. get-adcomputer -filter
1. get-aduser -filter

## Filter left, format right.
A famous paradigm in PowerShell is: **filter left, format right**. This means you should filter output as soon as possible. At the source, when available. Filtering using Where-Object is flexbile, but also more costly in terms of processing time and/or network transfers. Formatting is done on the right. To be precise: in the last part of your PowerShell command. If you're formatting for users, changes are you 

# Task 1: basic filtering
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


# Task: like and match
1. ```Get-Process | Where-Object ProcessName -match sh```
1. Note: if you don't get any output, try to use another text until you get a (preferred small) result.
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```

# Task: filtering at the source
1. ```Get-Process -Name *sys*```
1. get-childitem -filter
1. get-wmiobject -filter
1. required filters: Some command's can generate a lot of load. To make the scripter be cautious 
1. get-adcomputer -filter
1. get-aduser -filter

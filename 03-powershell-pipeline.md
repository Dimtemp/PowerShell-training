# PowerShell pipeline basics

## Task 1: Measuring
1. Open a PowerShell console.
1. Run this command: ```Get-Process```
1. This will display a process listing.
1. Run this command: ```Get-Process | Measure-Object```
1. This command measures the number of processes.
1. Run this command: ```Get-Process w*```
1. This command displays a list of processes with a name that starts with **w**. Count the number of processes.
1. Run this command: ```Get-Process w* | Measure-Object```
1. This command measures the number of processes with a name that starts with **w**. Verify that the number is correct.


## Task 2: Sorting
1. Open a PowerShell console.
1. Run this command: ```Get-Process```
1. This will display a process listing.
1. Run this command: ```Get-Process | Sort-Object id```
1. Run this command: ```Get-Process | Sort-Object Handles```
1. Notice that the process listing is sorted on the Handles column.
1. Run this command: ```Get-Process | Sort-Object Handles -Descending```
1. Notice that the process listing is sorted descending  on the Handles column.
1. Run this command: ```Get-Process | Sort id```
1. The result is sorted on the id column. Please notice the use of the sort alias instead of the Sort-Object cmdlet. Many commands that have a **Object** Noun, an alias exists without the noun. For example, Sort is an alias for Sort-Object, Measure is an alias for Measure-Object.


## Task 3: Group-Object
1. Retrieve a service listing by running this command:
1. ```Get-Service```
1. Notice that all services have a status. Most are running or stopped.
1. Group the services on status by running this command:
1. ```Get-Service | Group-Object```
1. The Count column specifies the number of services with a specific status. The Name column does not refer to the service name, but to the name of the status. Most will be Stopped or Started. The Group column contains all services with a specific status. The curly brackets { } indicate it's a collection of objects.

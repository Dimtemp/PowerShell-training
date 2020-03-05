# PowerShell pipeline basics

## Task 1: Sorting
1. Open a PowerShell console.
1. Run this command: ```Get-Process```
1. This will display a process listing.
1. Run this command: ```Get-Process | Sort-Object id```
1. Run this command: ```Get-Process | Sort-Object Handles```
1. Notice that the process listing is sorted on the Handles column.
1. Run this command: ```Get-Process | Sort-Object Handles -Descending```
1. Notice that the process listing is sorted descending  on the Handles column.
1. Run this command: ```Get-Process | Sort ```
1. 
Sort-Object

Select-Object

Where-Object

Measure-Object

Group-Object

Compare-Object

Alias!
Sort!

# The many faces of Select-Object

## Task 1: Selecting properties
1. Run the following command to view all processes with a name that start with **w**. This should produce a short list.
1. ```Get-Process w*```
1. Run the following command to view the previous processes, but only with a few specific properties: Id and Name.
1. ```Get-Process w* | Select-Object Id, Name```


## Task 2: The first will be last
1. The First and Last parameters of Select-Object can return a shorter list so you can focus on the biggest or smallest items. For instance: only display the disks with the least free disk space.
1. ```Get-Process | Select-Object -First 10```
1. ```Get-Process | Select-Object -Last 10```
1. Notice that the process listing is sorted alphabetically. We'll sort on workingset (WS), which gives an indication on memory usage.
1. ```Get-Process | Sort-Object WS | Select-Object -First 10```
1. This command produces a list with processes that have the least memory usage. Let's produce a list with the most memory intensive applications:
1. ```Get-Process | Sort-Object WS | Select-Object -Last 10```
1. By default sorting in PowerShell is performed ascending: 0..9, A..Z. You can also choose to sort the list descending. This gives a nice result combined with the -First parameter of Select-Object:
1. ```Get-Process | Sort-Object WS -Descending | Select-Object -Last 10```
1. Also notice that most parameters can be abbreviated:
1. ```Get-Process | Sort-Object WS -Desc | Select-Object -Last 10```
1. The previous example contains two commands that are generally abbreviated. The following command is not a recommended practice, but it works the same:
1. ```Get-Process | Sort WS -Desc | Select -Last 10```


## Task 3: The expanding universe
1. The ExpandProperty parameter of Select-Object can display hidden or truncated information.
1. Display the PowerShell version information: ```
1. ```Select-Object -ExpandProperty```


## Task 4: Hash as in hashtable
1. ```Select-Object @{name=''; expression={}}```
- formula + / - / * /  /1GB
- replace a column (test-connection)




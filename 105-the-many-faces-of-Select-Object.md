# The many faces of Select-Object

## Task 1: Selecting properties
1. Run the following command to view all processes with a name that start with **w**. This should produce a short list.
1. ```Get-Process w*```
1. Run the following command to view the previous processes, but only with a few specific properties: Id and Name.
1. ```Get-Process w* | Select-Object Id, Name```
1. ```Get-Process w* | Select-Object Id, Name```


## Task 2: The first will be last
1. The First and Last parameters of Select-Object can return a shorter list so you can focus on the biggest or smallest items. For instance: only display the disks with the least free disk space. These need your attention first.
1. ```Get-Process | Select-Object -First 10```
1. ```Get-Process | Select-Object -Last 10```
1. ```Get-Process | Sort-Object Handles | Select-Object -First 10```
1. ```Get-Process | Sort-Object Handles | Select-Object -First 10```
1. ```Get-Process | Select-Object -Last 10```


## Task 3: The expanding universe
1. The ExpandProperty parameter of Select-Object can display hidden or truncated information.
1. ```Select-Object -ExpandProperty```


## Task 4: Hash as in hashtable
1. ```Select-Object @{name=''; expression={}}```
- formula + / - / * /  /1GB
- replace a column (test-connection)




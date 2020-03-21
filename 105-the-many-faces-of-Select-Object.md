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
1. The ExpandProperty parameter of Select-Object can display truncated or hidden information.
1. Display the PowerShell version information: ```$Host```
1. Notice the Version. Now display only the version using Select-Object:
1. ```$Host | Select-Object Version```
1. Notice the Version. It displays in the same way as the first comand.
1. Now display the version using the ExpandProperty of Select-Object: ```$Host | Select-Object -ExpandProperty Version```
1. You'll notice extra information was hidden inside the version property.


## Task 4: Hash as in hashtable
1. With Select-Object you can replace columnheaders and perform data modifications and calculations.
1. Let's run a WMI command to retrieve disk space (WMI is covered in a later module in depth).
1. ```Get-WmiObject -class win32_logicaldisk```
1. Notice the FreeSpace and Size properties. It'll probably include so many digits it's hard to tell what the size is, and how many freespace there still is.
1. Let's perform a calculation on the data: ```Get-WmiObject -class win32_logicaldisk | Select-Object DeviceID, @{name='Size(G)'; expression={$_.Size/1GB}}```
1. The @-sign instructs PowerShell to create a hashtable, which is a propertyname and it's value. That's what name and expression refer to within the {} brackets. The name is the name of the property. Expression refers to the formula you want to use to calculate the property value. In this case we're deviding the number of bytes by a Gigabyte.
1. The size is now displayed in gigabytes.
1. Let's do the same for freespace, while keeping the previous two properties: DiveID and Size.
1. ```Get-WmiObject -class win32_logicaldisk | Select-Object DeviceID, @{name='Size(G)'; expression={$_.Size/1GB}}, @{name='FreeSpace(G)'; expression={$_.FreeSpace/1GB}}```
1. The output probably contains a lot of digits. Let's round the numbers so we get humanreadable output.
1. ```Get-WmiObject -class win32_logicaldisk | Select-Object DeviceID, @{name='Size(G)'; expression={[int]($_.Size/1GB)}}, @{name='FreeSpace(G)'; expression={[int]($_.FreeSpace/1GB)}}```

- formula +
- replace a column (test-connection)




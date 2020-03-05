# Working with files
### Note: it is required that you have learned how to work with Select-Object.


## Task 1: text files
1. Get-Process
1. Get-Process w*
1. Get-Process w* | Out-File procs.txt
1. Get-Content procs.txt
1. The output looks like a regular PowerShell table. However, the PowerShell table has been written as-is to a text file. So after reading the text file, you're not dealing with a PowerShell table anymore. Selecting and sorting is not done in the same way.
1. This doesn't work:
1. Get-Content procs.txt | Select-Object Handles, ID
1. This doesn't work:
1. Get-Content procs.txt | Sort-Object Handles


## Task 2: CSV (comma seperated values) files
1. Get-Process w* | Export-CSV procs.csv
1. Import-CSV procs.csv


## Task 3: XML (Extensible Markup Language) files
1. This command might take some time if you're not using a recent PowerShell version.
1. Get-Process w* | Export-CliXML procs.xml
1. Import the process listing to verify it's read correctly. Unlike the CSV file, this list presents a nice table.
1. Import-CliXML procs.xml
1. Verify that all hidden properties are still available.
1. Import-CliXML procs.xml | Select-Object Id, ProcessName, Path
1. Verify that hidden properties are sortable.
1. Import-CliXML procs.xml | Select-Object Id, ProcessName, Path | Sort-Object Id


## Task 4: Using Compare-Object
1. Export another process listing. Please notice it's an unfiltered list (without w*), and we're writing to a new file (procs-A.xml).
1. Get-Process | Export-CliXML procs-A.xml
1. Import-CliXML procs-A.xml
1. Start a process by entering this command: Notepad
1. You now have notepad running.
1. Export the current list of processes to another new file: Get-Process | Export-CliXML procs-B.xml
1. $procsA = Import-CliXML procs-A.xml
1. $procsB = Import-CliXML procs-B.xml
1. Compare-Object $procsA $procsB

1. You can do the same without exporting the second process listing to XML. Just write the output to a variable, instead of an XML file.
1. $procsB = Get-Process
1. Compare-Object $procsA $procsB
1. Note: $procsA is still populated with the first processlisting. There's no need to perform another export.




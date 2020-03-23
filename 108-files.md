# Filing all these files

In this exercise we're going to work with different file types. You'll discover how easy it is to write and read from files, and discover that different filetypes have different purposes.

### Note: it is required that you have learned how to work with Select-Object.

## Task 1: writing to text files
1. Open PowerShell.
1. Create a new file which contains three usernames with this command:
1. ```'Alice', 'Bob', 'Carol' | Out-File userlist.txt```
1. Please note the special use of punctuation marks. We're creating three users surrounded by quotationmarks. Three users are separated by two comma's.
1. Read the text file with this command: ```Get-Content userlist.txt```
1. Notice three users are returned on three different lines.


## Task 2: processing text files
1. Run this command: ```Get-Process```
1. This returns a process listing.
1. Run this command: ```Get-Process w*```
1. This returns a short process listing.
1. Run this command: ```Get-Process w* | Out-File procs.txt```
1. This writes the short process listing to a text file.
1. Run this command: ```Get-Content procs.txt```
1. The output looks like a regular PowerShell table. However, the PowerShell table has been written as-is to a text file. So after reading the text file, you're not dealing with a PowerShell table anymore. Selecting and sorting is not done in the same way.
1. This doesn't work: ```Get-Content procs.txt | Select-Object Handles, ID```
1. This also doesn't work: ```Get-Content procs.txt | Sort-Object Handles```
Note: you might be able to use Select-Object and Sort-Object on text files using ConvertFrom-String, but it's a best practice to avoid using text files.


## Task 3: Comma Seperated Values (CSV) files
1. Run this command: ```Get-Process w*```
1. A short process listing is displayed on the screen.
1. Run this command: ```Get-Process w* | Export-CSV procs.csv```
1. A short process listing has been exported to CSV.
1. Import the CSV file using this command: ```Import-CSV procs.csv```
1. The output looks a lot different than the table we had in the first place. This is because all data is being exported to disk. That's the default in PowerShell. It handles all data. Only when data is being written to screen, it has to decide whether output to screen should be formatted in a more user-friendly way.


## Task 4: Extensible Markup Language (XML) files
1. This command might take some time: ```Get-Process w* | Export-CliXML procs.xml```
1. Import the process listing to verify it's read correctly: ```Import-CliXML procs.xml```
1. Unlike the CSV file, this import presents a nice table.
1. Verify that all hidden properties are still available: ```Import-CliXML procs.xml | Select-Object Id, ProcessName, Path```
1. Verify that properties are sortable: ```Import-CliXML procs.xml | Sort-Object Id | Select-Object Id, ProcessName, Path```


## Task 5: Using Compare-Object
1. Export another process listing. Please notice it's an unfiltered list (without w*), and we're writing to a new file (procs-A.xml).
1. Run this command to export the process listing: ```Get-Process | Export-CliXML procs-A.xml```
1. Run this command to verify the file: ```Import-CliXML procs-A.xml```
1. Start a process by entering this command: Notepad
1. You now have notepad running.
1. Export the current list of processes to another new file: ```Get-Process | Export-CliXML procs-B.xml```
1. Run this command: ```$procsA = Import-CliXML procs-A.xml```
1. Run this command: ```$procsB = Import-CliXML procs-B.xml```
1. Run this command: ```Compare-Object $procsA $procsB```
1. ?
1. You can do the same without exporting the second process listing to XML. Just write the output to a variable, instead of an XML file.
1. Run this command: ```$procsB = Get-Process```
1. Run this command: ```Compare-Object $procsA $procsB```
1. Note: $procsA is still populated with the first processlisting. There's no need to perform another export.


## Task 5: HTML files
1. To display a list of running processes, that shows only the number of handles, Id and process name
1. Run this command: ```Get-Process | Sort-Object Handles -Descending | Select-Object -First 10 Handles, Id, ProcessName```
1. To convert the process list to an HTML page, run:
1. Run this command: ```Get-Process | Sort-Object Handles -Descending | Select-Object -First 10 Handles, Id, ProcessName | ConvertTo-HTML```
1. To save the HTML page in a file, run:
1. Run this command: ```Get-Process | Sort-Object Handles -Descending | Select-Object -First 10 Handles, Id, ProcessName | ConvertTo-HTML | Out-File Report.html```
1. To view the HTML file, run:
1. Run this command: ```Invoke-Item Report.html```
1. To create another HTML file, run:
1. Run this command: ```Get-Process | Sort-Object Handles -Descending | Select-Object -First 10 Handles, Id, ProcessName | ConvertTo-HTML –PreContent 'Biggest Processes by handle count' –PostContent (Get-Date) | Out-File Report.html```
1. To view the HTML file, run:
1. Run this command: ```Invoke-Item Report.html```

Results: After completing this exercise, you will have converted objects to different forms of data.


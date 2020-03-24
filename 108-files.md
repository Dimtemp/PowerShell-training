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
1. Inspect the CSV with notepad: ```notepad procs.csv```
1. The contents in notepad look a lot different than the table we had in the first place. This is because all data has been exported to disk.
1. Also notice two particular fields in the header of the file: Path and Company.
1. Import the CSV file using this command: ```Import-CSV procs.csv```
1. The output looks a lot different than the table we had in the first place. That's because all data is present in the CSV file. Not just the eight (or so) columns in the original table. During import, PowerShell doesn't recognize it's a process listing, so it displays all the information.
1. Notice we can select properties that were not shown previously: ```Import-CSV procs.csv | Select-Object Company, ProcessName, Path```
1. We can try to format the output like the table that Get-Process produces: ```Import-CSV procs.csv | Select-Object Handles, NPM, PM, WS, ID, ProcessName```
1. Try to sort on ProcessName: ```Import-CSV procs.csv | Sort-Object ProcessName | Select-Object Handles, ProcessName```
1. It works. Now try to sort on Handles: ```Import-CSV procs.csv | Sort-Object Handles | Select-Object Handles, ProcessName```
1. The Handles column is sorted alphabetically, and not numerically. This has no use to me. Clearly, the CSV output is not as human friendly as the first table. Maybe an XML file can help.


## Task 4: Extensible Markup Language (XML) files
1. This command might take some time: ```Get-Process w* | Export-CliXML procs.xml```
1. Verify the file with Notepad: ```notepad procs.xml```
1. It should be recognizable as a XML file. Close notepad.
1. Import the process listing to verify it's read correctly: ```Import-CliXML procs.xml```
1. Unlike the CSV file, this import presents a nice table. This is because, unlike the CSV, metadata is retained. You can verify with Get-Member.
1. Run this command: ```Import-CliXML procs.xml | Get-Member```
1. Scroll to the beginning of the output and verify that the first line reads: **TypeName: Deserialized.System.Diagnostics.Process**
1. This way, PowerShell can recognize it's a process listing.
1. Verify that all hidden properties are still available: ```Import-CliXML procs.xml | Select-Object Company, ProcessName, Path```
1. Verify that properties are sortable: ```Import-CliXML procs.xml | Sort-Object Handles | Select-Object Handles, ProcessName, Path```


## Task 5: Using Compare-Object
1. Export another process listing. Please notice it's an unfiltered list (without w*), and we're writing to a new file (**procs-A.xml**).
1. Run this command to export the process listing: ```Get-Process | Export-CliXML procs-A.xml```
1. Run this command to verify the file: ```Import-CliXML procs-A.xml```
1. This should generate a process table.
1. Start a new process by entering this command: ```mspaint```
1. You now have Paint running. Minimize it.
1. Export the current list of processes to a second file: ```Get-Process | Export-CliXML procs-B.xml```
1. We're going to read the two XML files into memory, and store them in a variable. Variables are discussed in-depth later.
1. Run this command to import the first processlist: ```$procsA = Import-CliXML procs-A.xml```
1. Run this command to import the second process list: ```$procsB = Import-CliXML procs-B.xml```
1. Run this command to compare the two process listings: ```Compare-Object $procsA $procsB```
1. The output of this command might produce different results. There might be now output at all, or the output is not what you expected. We expect Compare-Object to display the differences in the two process listings. You should inform Compare-Object what to specifically look for. Let's choose ProcessName as the property that we want to see when looking for differences.
1. Run this command: ```Compare-Object $procsA $procsB -Property ProcessName```
1. Again, the results might vary. What we need to see is that the mspaint process is displayed with a '=>' SideIndicator. This means it's present in the second file, and not in the first.
1. If there are any other processes displayed in the output, it's because other processes might have been stopped or started after the  creation of the first XML file.


## Task 6: Using Compare-Object with services
1. Run this command to export a service listing: ```Get-Service | Export-CliXML service-A.xml```
1. Run this command to verify the file: ```Import-CliXML service-A.xml```
1. This should generate a service table.
1. Inspect the spooler service: ```Get-Service Spooler```
1. If it's currently running, stop it: ```Stop-Service Spooler```
1. If it's currently stopped, start it: ```Start-Service Spooler```
1. The result should be that the spooler service is in a different state, than it was when we created the file.
1. Export the current service list to a second file: ```Get-Service | Export-CliXML service-B.xml```
1. Run this command to verify the file: ```Import-CliXML service-B.xml```
1. This should generate a service table.
1. Again, we're going to read the two XML files into memory, and store them in a variable.
1. Run this command to import the first processlist: ```$svcA = Import-CliXML service-A.xml```
1. Run this command to import the second process list: ```$svcB = Import-CliXML service-B.xml```
1. Run this command to compare the two process listings: ```Compare-Object $svcA $svcB```
1. The output of this command is empty. We expect Compare-Object to display the differences in the two service listings. You should inform Compare-Object what to specifically look for. Let's choose Name as the property that we want to see when looking for differences.
1. Run this command: ```Compare-Object $svcA $svcB -Property Name```
1. Again, the output is empty. That's because no services were created or removed since we created the first XML file.
1. Now focus on a change in status (running or stopped): ```Compare-Object $svcA $svcB -Property Status```
1. The result is that 'something' is running, and 'something' is stopped.
1. To view **which** service has a change in state we need to inform Compare-Object to focus on two properties. Any changes in Name and/or state should be displated: ```Compare-Object $svcA $svcB -Property Name, Status```
1. Now the Spooler service is displayed with it's state in the original file (SideIndicator: '<='), and it's state in the second file (SideIndicator: '=>').


## Task 7: Using Compare-Object with only one reference file
1. You can do the same without exporting the second service listing to XML. Just write the output to a variable, instead of an XML file.
1. Run this command to export a service listing: ```Get-Service | Export-CliXML service-A.xml```
1. Inspect the spooler service: ```Get-Service Spooler```
1. If it's currently running, stop it: ```Stop-Service Spooler```
1. If it's currently stopped, start it: ```Start-Service Spooler```
1. The result should be that the spooler service is in a different state, than it was when we created the file.
1. Some time later, we need to verify the current service listing with the one stored on disk.
1. First, read the XML file into a variable: ```$svcA = Import-CliXML service-A.xml```
1. Second, save the current service list directly to a variable: ```$svcB = Get-Service```
1. Compare the two variables: ```Compare-Object $svcA $svcB -Property Name, Status```
1. This procedure is a lot shorter than the procedure in task 6. We only need to store the XML file once, to perform comparisons on the current state.


## Task 5: HTML files
1. Run this command to display a list of running processes, that show only the working set (WS), Id and process name, sorted by working set: ```Get-Process | Sort-Object WS | Select-Object WS, Id, ProcessName -First 10```
1. To convert the process list to an HTML page, run this command: ```Get-Process | Sort-Object WS | Select-Object WS, Id, ProcessName -First 10 | ConvertTo-HTML```
1. The HTML output is displayed in the PowerShell console window. That's not what we want.
1. To save the HTML page to a file, run: ```Get-Process | Sort-Object WS | Select-Object WS, Id, ProcessName -First 10 | ConvertTo-HTML | Out-File Report.html```
1. To view the HTML file, run: ```Invoke-Item Report.html```
1. If this doesn't work, navigate to the file with Windows Explorer and double click it.
1. To create another HTML file, run:
1. Run this command: ```Get-Process | Sort-Object WS | Select-Object WS, Id, ProcessName -First 10 | ConvertTo-HTML –PreContent 'Biggest Processes by working set' –PostContent (Get-Date) | Out-File Report.html```
1. To view the HTML file, run: ```Invoke-Item Report.html```

Results: After completing this exercise, you will have converted objects to different file formats.


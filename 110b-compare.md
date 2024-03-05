## Task 5: Using Compare-Object
1. Export a process listing. Please notice it's an unfiltered list, and we're writing to a new file (**procs-A.xml**): ```Get-Process | Export-CliXML procs-A.xml```
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



# Working with Credentials

## Task 1: Create a credential object
1. Run this command to create a credential variable in memory: ```$cred = Get-Credential –Credential 'ADATUM\Administrator'```
1. In the dialog box, enter **Pa55w.rd** and press Enter.
1. Run this command to specify the credentials for a remote command: ```Invoke-Command –ComputerName Server1 –Credential $cred –ScriptBlock { Get-ADUser –Filter *  }```
1. Store the credentials on disk by writing them to a XML file: ```$cred | Export-CliXML cred.xml```
1. Inspect the contents of the XML file: ```Get-Content cred.xml```
1. Notice the password is stored in encrypted form.

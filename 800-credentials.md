# Working with Credentials
Storing credentials or passwords securely using PowerShell involves using encryption to ensure that sensitive information is not accessible in plaintext. PowerShell offers several mechanisms for handling sensitive information securely, including the use of ConvertTo-SecureString and Export-Clixml, which allow you to encrypt passwords and save them in a secure format. Secure string will be encrypted using the Windows Data Protection API (DPAPI), which encrypts data using a key derived from the user's login credentials. This means that sensitive info stored in this way can only be retrieved by the user account with which the files were created. 

Here's how you can securely store a password using these commands and export it to an XML file.

## Task 1: Create a credential object
1. Run this command to create a credential variable in memory: ```$cred = Get-Credential –Credential 'ADATUM\Administrator'```
1. In the dialog box, enter **Pa55w.rd** and press Enter.
1. Run this command to specify the credentials for a remote command: ```Invoke-Command –ComputerName Server1 –Credential $cred –ScriptBlock { Get-ADUser –Filter *  }```
1. Store the credentials on disk by writing them to a XML file: ```$cred | Export-CliXML cred.xml```
1. Inspect the contents of the XML file: ```Get-Content cred.xml```
1. Notice the password is stored in encrypted form.

## Task 2: store a password securely:
1. Run this command to enter a password securely: ```$SecurePassword = Read-Host -AsSecureString -Prompt 'Please enter password'```
1. Run this command to store the password: $SecurePassword | Export-Clixml -Path password-details.xml, replace details with your specific details, like service name.
1. Inspect the contents of the XML file: ```Get-Content cred.xml```
1. Notice the password is stored in encrypted form.

# Working with Credentials

## Task 1: Create a credential object
1. $cred = Get-Credential –Credential ADATUM\Administrator
1. In the dialog box, enter Pa$$w0rd and press Enter.
1. Invoke-Command –ComputerName Server1 –Credential $cred –ScriptBlock { Get-ADUser –Filter *  }

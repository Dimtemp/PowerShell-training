Working with Credentials

Task 1: Create a credential object
$cred = Get-Credential –Credential ADATUM\Administrator
In the dialog box, enter Pa$$w0rd and press Enter.
Invoke-Command –ComputerName Server1 –Credential $cred –ScriptBlock { Get-ADUser –Filter *  }

# Unlimited drives (no joke!)
In this chapter we're going to work with the filesystem and other 'providers'. Make sure you perform this procedure on a computer where you have write permissions, and where you can break a leg.

## Task: PowerShell drives
PowerShell has mapped many databases and repositories (also called providers) to drives. This helps us in navigating and manipulating these providers with a uniform toolset.
1. Run this command: ```Get-PSDrive```
1. Notice the listing of drives. You might organize them in three categories:
1. A] Drives that are here for backward compatability with MS-DOS. At least the C-drive should be present. Maybe network drives, or removable drives fall into this category also. These drives allways have one driveletter, so the maximium number of drives in this category is limited to 26.
1. B] Drives that are actually mapping to well-know Windows repositories, like the Registry, environment variables and the certificate store.
1. C] Drives that are PowerShell native. These exist only in PowerShell, and fullfill their purpose only for PowerShell. These are the alias-drive, the function-drive, and the variable-drive.
1. Let's experiment with these drive in the next tasks.


## Task: basic file processing
1. Open a new PowerShell console.
1. Run this command (notice the backslash at the end): ```Get-ChildItem \```
1. This results in a directory listing at the root of te drive.
1. Run this command: ```Get-ChildItem```
1. This results in a directory listing at the current folder, which might be empty.
1. To create a folder at the current directory, run this command: ```New-Item –Path . –Name Folder1 –ItemType Directory```
1. In my humble opinion, this is an absurd command to create a directory. Microsoft agrees, so they shipped two alternative commands with PowerShell to create folders.
1. Run this command to create a folder the MS-DOS way: ```md Folder2```
1. Inspect with: ```Get-ChildItem```
1. You can also inspect with: ```Get-ChildItem -Directory```
1. This lists only directories. This last command would be ```dir /AD``` in MS-DOS (any grown-ups amongst us?).
1. Inspect the md command with Get-Command: ```Get-Command md```
1. It's an alias, pointing to mkdir. Inspect that with Get-Command: ```Get-Command mkdir```
1. mkdir is a function. When we follow best practices, it's best to avoid the use of md. If you want to use mkdir or New-Item is up to you.
1. Now create a third folder running this command: ```mkdir Folder3```
1. Inspect with: ```Get-ChildItem -Directory```
1. Now remove all folders:
1. ```Remove-Item Folder1```
1. ```Remove-Item Folder2```
1. ```Remove-Item Folder3```


# Task: creating drive mappings
1. Run this command to create a drivemapping to the domain controller:
1. ```New-PSDrive –Name N –Root '\\LON-DC1\NETLOGON' –PSProvider FileSystem```
1. Note: in MS-DOS and later Operating Sysyems, we would have run ```Net USE N: \\LON-DC1\NETLOGON```
1. Inspect with ```Get-ChildItem N:\```
1. Run this command to create a mapping to an existing folder:
1. ```New-PSDrive –Name Programs –Root 'C:\Program Files' –PSProvider FileSystem```
1. Inspect with ```Get-ChildItem Programs:\```
1. Since drives are not limited anymore to one driveletter, the number of drives is virtually endless. There's one catch: drives you create here are not presented in Windows and/or Windows Explorer, unless you make the persistent.
1. This is the only way to make drives visible in Windows, which are actually ordinary drive mappings to network shares:
1. ```New-PSDrive –Name L –Root '\\LON-DC1\NETLOGON' –PSProvider FileSystem -Persist```
1. Notice the Persist parameter, to make the mapping show up in Windows Explorer, and survive reboots.


## Task: certificate store
1. Run this command: ```Get-ChildItem Cert:\```
1. This displays to locations: CurrentUser and LocalMachine.
1. Let's navigate to LocalMachine: ```Get-ChildItem Cert:\LocalMachine\```
1. This displays all folders where certificates can be stored on this computer.
1. Run this command to view the certificates in the Root folder, which is the Trusted Root CA store (not the root of a drive): ```Get-ChildItem Cert:\LocalMachine\Root\```
1. Notice the certificates of trusted root certificate authoroties that exist in your computer.
1. Run this command to inspect a single certificate:
1. ```Get-ChildItem Cert:\LocalMachine\Root\ | Select-Object -first 1 |  Format-List```
1. This final command displays extra properties, like an expiration date (NotAfter).


# Task: Registry
### Note: this only works on Windows.
1. ```New-Item –Path HKCU:\Software –Name Scripts```
1. ```New-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Run -Name 'PowerShell' –Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'```


## Task: environment variables
1. 


## Task: aliases
1. Run this command (notice the trailing colon ':'): ```Get-ChildItem Alias:```
1. This command displays all aliases.
1. Run this command: ```Get-Alias```
1. This displaus the same alias listing. There is no difference.

## Task: functions
1.


## Task: variables
1. 




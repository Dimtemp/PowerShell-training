# Unlimited drives
In this chapter we're going to work with the filesystem and other 'providers'. Make sure you perform this procedure on a computer where you have write permissions, and where you can break a leg.

It's assumed you have performed the datetime exercise before beginning with this module.

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


## Task: creating drive mappings
1. Run this command to create a drivemapping to the domain controller:
1. ```New-PSDrive –Name S –Root '\\LON-DC1\SYSVOL' –PSProvider FileSystem```
1. Note: in MS-DOS and later Operating Sysyems, we would have run ```Net USE S: \\LON-DC1\SYSVOL```
1. Inspect with ```Get-ChildItem S:\```
1. Run this command to create a mapping to an existing folder:
1. ```New-PSDrive –Name Programs –Root 'C:\Program Files' –PSProvider FileSystem```
1. Inspect with ```Get-ChildItem Programs:\```
1. Since drives are not limited anymore to one driveletter, the number of drives is virtually endless. There's one catch: drives you create here are not presented in Windows and/or Windows Explorer, unless you make the persistent.
1. This is the only way to make drives visible in Windows, which are actually ordinary drive mappings to network shares:
1. ```New-PSDrive –Name T –Root '\\LON-DC1\SYSVOL' –PSProvider FileSystem -Persist```
1. Notice the Persist parameter, to make the mapping show up in Windows Explorer, and survive reboots.
1. Verify the drive mapping in Windows Explorer.


## Task: certificate store
#### Note: this only works on Windows.
1. Run this command: ```Get-ChildItem Cert:\```
1. This displays to locations: CurrentUser and LocalMachine.
1. Let's navigate to LocalMachine: ```Get-ChildItem Cert:\LocalMachine\```
1. This displays all folders where certificates can be stored on this computer.
1. Run this command to view the certificates in the Root folder, which is the Trusted Root CA store (not the root of a drive): ```Get-ChildItem Cert:\LocalMachine\Root\```
1. Notice the certificates of trusted root certificate authoroties that exist in your computer.
1. Run this command to inspect a single certificate:
1. ```Get-ChildItem Cert:\LocalMachine\Root\ | Select-Object -first 1 |  Format-List```
1. This final command displays extra properties, like an expiration date (NotAfter).


## Task: Registry
#### Note: this only works on Windows.
1. Run this command to inspect the registry: ```Get-ChildItem HKCU:```
1. Run this command: ```regedit```
1. Navigate to this key: HKEY_CURRENT_USER\Control Panel\Desktop
1. Notice the Wallpaper setting near the bottom.
1. Return to the PowerShell console (leave regedit open).
1. Run this command to inspect the registry: ```Get-ChildItem 'HKCU:\Control Panel\Desktop'```
1. Now compare the output with regedit. In PowerShell, only data is displayed in the subfolder from the current location. We need another command to inspect the registry settings from the current location:
1. Run this command to inspect the registry: ```Get-Item 'HKCU:\Control Panel\Desktop'```
1. Now the wallpaper item is visible.
1. Create a new folder in the registry: ```New-Item –Path HKCU:\Software –Name MyCompany```
1. Create an item in the folder: ```New-ItemProperty -Path HKCU:\Software\MyCompany -Name 'PortNumber' –Value 443```
1. Inspect the new items with regedit.


## Task: environment variables
#### Note: this only works on Windows.
1. Run this command to display all environment variables: ```Get-ChildItem Env:```
1. Inspect a single environment variable: ```$Env:Path```
1. Notive the $-sign: it tells PowerShell to work with the contents of the environment value. Also notice we don't need Get-ChildItem anymore.
1. The previous command would be like this in MS-DOS: ```echo %PATH%``` (this doesn't work in PowerShell).
1. Pipe the output to Get-Member to inspect it's properties: ```$Env:Path | Get-Member```
1. Notice the TypeName on top: it should be System.String.
1. Since the path is a string (expected), we can use a method to make it more readable:  ```$Env:Path.Split(';')```


## Task: aliases
1. Run this command (notice the trailing colon ':'): ```Get-ChildItem Alias:```
1. This command displays all aliases.
1. Run this command: ```Get-Alias```
1. This displaus the same alias listing. There is no difference.


## Task: variables
1. Run this command (notice the trailing colon ':'): ```Get-ChildItem Variable:```
1. Most variables are system variables, because we haven't created many variables yet.
1. Run this command to create a variable: ```$x = 15```
1. Inspect with: ```Get-ChildItem Variable:```
1. Notice the variable at the bottom with the name x, and the Value 15. The $-sign is not shown, because the $-sign is not a part of the name of the variable. It informs PowerShell we want to work with the value of the variable.
1. Run this command to create a variable: ```New-Variable -Name y -Value 20```
1. Inspect with: ```$y```


## Task: functions
1. Run this command (and notice the final colon ':'): ```Get-ChildItem Function:```
1. There are a few functions that are special:
1. - help: which in it's turn, calls Get-Help.
1. - prompt: which contains the definition of the PowerShell prompt.
1. - TabExpansion2: which is called everytime you press Tab.
1. Let's focus on one function. Run this command to view the prompt command: ```Get-Command prompt```
1. It informs us the prompt is a function, which we alread knew.
1. Pipe it to Get-Member to inspect other properties: ```Get-Command prompt | Get-Member```
1. It tells us there's a Definition property (somewhere in the middle of the listing).
1. Run this command to view the prompt definition: ```Get-Command prompt | Select-Object definition```
1. PowerShell decides not to show the definition, because it might be too big.
1. Run this command to view the prompt definition: ```Get-Command prompt | Select-Object -ExpandProperty definition```
1. You're viewing the definition of the prompt.
1. You can change the prompt easily. Just define a new function. Remember, these functions only exist in memory. If you screw up, just close the PowerShell window.
1. Run this command to customize the prompt: ```function prompt { '> ' }```
1. This is a very minimalistic prompt.
1. Run this command for a prompt that resembles the Linux prompt: ```function prompt { "$env:USERNAME@$env:COMPUTERNAME >" }```
1. Close the PowerShell window.

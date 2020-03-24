# Scripting

## Task 1: Your first script file
1. Open a PowerShell console as administrator.
1. Change to your home directory: ```Set-Location $home```
1. Run this command: ```Get-ExecutionPolicy```
1. The exectution policy should be restricted. This means scripts are not allowed to execute.
1. **Note: If the execution policy os not restricted, set it to restricted with this command: ```Set-ExecutionPolicy Restricted```**
1. Create a script file with this command: ```'Get-Process w*' | Out-File MyScript.ps1```
1. Pay special attention to the quotation marks in the previous command. A string should be written to the file. Not a process listing.
1. Verify the file: ```Get-ChildItem MyScript.ps1```
1. It should be at most 20-30 bytes.
1. Now run the script with this command: ```MyScript.ps1```
1. Verify that you receive an error.
1. Now run the script with this command (notice the .\ ): ```.\MyScript.ps1```
1. Verify that you still receive an error.
1. Set the execution policy to Unrestricted: ```Set-ExecutionPolicy Unrestricted```
1. Confirm with **Y**.
1. Run this command to verify the policy has been set to Unrestricted: ```Get-ExecutionPolicy```
1. Now run the script with this command: ```.\MyScript.ps1```
1. Verify that you can run the script.
1. Return the execution policy to the defauilt: ```Set-ExecutionPolicy Restricted```
1. Run this command to verify the execution policy is back to it's default: ```Get-ExecutionPolicy```


## Task 2: Bypass the execution policy
1. Rightclick the Windows start button, click Run, type **cmd** and press enter.
1. In the cmd window, start PowerShell using the ```PowerShell``` command.
1. If PowerShell is started, inspect the execution policy: ```Get-ExecutionPolicy```
1. Change to your home directory: ```Set-Location $home```
1. Try to run the script: ```.\MyScript.ps1```
1. It doesn't run since the execution policy is still restricted.
1. Exit PowerShell to return to the cmd console: ```exit```
1. In the cmd console, start PowerShell with an alternative execution policy: ```PowerShell -ExecutionPolicy Unrestricted```
1. If PowerShell is started, inspect the execution policy: ```Get-ExecutionPolicy```
1. Notice the execution policy is now unrestricted.
1. Change to your home directory: ```Set-Location $home```
1. Try to run the script: ```.\MyScript.ps1```
1. Now the script runs because the execution policy is unrestricted.
1. Exit PowerShell to return to the cmd console: ```exit```

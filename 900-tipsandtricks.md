# Custom prompt
1. Start a PowerShell session and run this command to inspect the pre-loaded functions (**notice the colon at the end**): ```Get-ChildItem function:```
2. Notice a **prompt** function. 
3. Let's investigate the contents of the **prompt** function: ```$function:prompt```
4. You can replace the default prompt with a custom prompt by definining a function with the name **prompt**: ```function prompt { "PS> " }```
5. Notice the custom prompt that returns at this moment.
6. You might want to use environment variables in a custom prompt. Let's mimic a Unix/Linux prompt: ```function prompt { "[$env:username@$env:computername] " }```
7. Sadly, the prompt is being reset as soon as you close the PowerShell session. We'll store the custom prompt in a profile in a later exercise.
8. For more information, run this command: ```Get-Help about_Prompts```


# PSDefaultParameterValues
Let's assume you **always** run a specific command with the Force parameter: ```Get-ChildItem -Force```. You can set custom default values for cmdlet and advanced function parameters. This way, you don't need to specify those parameters anymore.
1. Run this command to inspect the current default parameters value variable: ```$PSDefaultParameterValues```
2. It is expected to be empty.
3. Run this command to verify a regular directory listing: ```Get-ChildItem $HOME```
4. Run this command to verify a forced directory listing: ```Get-ChildItem $HOME -Force```
5. Notice the last command might include hidden files.
6. Now run this command to specify the Force parameter for the Get-ChildItem command by default: ```$PSDefaultParameterValues = @{"Get-ChildItem:Force"=$true}```
7. Run this command to verify a forced directory listing: ```Get-ChildItem $HOME```
8. Notice the **absence** of a Force parameter, but the output includes hidden files.
9. To set default values for multiple parameters, separate each key/value pair with a semicolon (;): ```$PSDefaultParameterValues = @{"Get-ChildItem:Force"=$true; "Sort-Object:Descending"=$true}```
10. Run this command to verify a forced directory listing: ```Get-ChildItem $HOME```
11. Run this command to verify a descending sorted process listing: ```Get-Process | Select-Object Id, ProcessName | Sort-Object Id```
12. Sadly, the custom parameter values are being reset as soon as you close the PowerShell session. We'll store it in a profile in the next exercise.
13. For more information, run this command: ```Get-Help about_Parameters_Default_Values```


# PowerShell profile
A PowerShell profile is a PowerShell script that will be executed each time that PowerShell starts. With this file you can prepare your PowerShell environment more specifically for a user or computersystem. A custom prompt, or specific parameter values, are popular items to store in a profile.
1. Run this command to navigate to the home directory: ```Set-Location $HOME```
2. Run this command to navigate to the Documents\WindowsPowerShell location: ```Set-Location Documents\WindowsPowerShell```
3. If the last command fails because the folder does not exists, run this command: ```mkdir Documents; mkdir Documents\WindowsPowerShell```
4. Create a PowerShell profile using notepad: ```notepad profile.ps1```
5. Now put this text in the notepad window and save it:
6. ```function prompt { "[$env:username@$env:computername] " }```
7. ```$PSDefaultParameterValues = @{"Get-ChildItem:Force"=$true; "Sort-Object:Descending"=$true}```
8. Start a new PowerShell session.
9. Verify the custom prompt is displayed.
10. Run this command to verify a forced directory listing: ```Get-ChildItem $HOME```
11. Run this command to verify a descending sorted process listing: ```Get-Process | Select-Object Id, ProcessName | Sort-Object Id```

Profiles that are created in the **$PSHOME** folder, instead of the **$HOME** folder, also load automatically when PowerShell starts. This might require extra permissions. Also, a profile created in the **$PSHOME** folder applies to every PowerShell user of the system, where a profile created in the **$HOME** folder is personal.

1. For more information, run this command: ```Get-Help about_Profiles```

# PowerShell history
A famous saying goes like this: "those who don't know history are destined to repeat it". You don't want to keep typing the same commands over and over again, do you? So here are some history lessons.

## Task 1: History
1. Open a PowerShell console.
1. Run this command: ```Get-Process```
1. Run this command: ```Get-Service```
1. Run this command: ```Get-ChildItem```
1. Now that we have some commands in our session history, let's investigate it.
1. Run this command: ```Get-History```
1. This should list at least the last three commands.
1. Run this command to close PowerShell: ```exit```

## Task 2: psreadline
1. Open a new PowerShell console.
1. Run this command: ```Get-History```
1. Notice the history is empty. When closing PowerShell the history is cleared from memory.
1. Use the up and down arrow keys on your keyboard to navigate the history. Since PowerShell 5 a new component was introduced to keep commands in history. This component is the PSReadLine module.
1. Run this command to verify the PSReadLine module is present in memory: ```Get-Module```
1. Run this command to remove the PSReadLine module from memory: ```Remove-Module PSReadline```
1. Run this command to close PowerShell: ```exit```
1. Open a new PowerShell console.
1. Run this command to verify the PSReadLine module is present in memory: ```Get-Module```
1. Removing the module only removes the module from memory. Every time PowerShell is started, the PSReadLine module is loaded into memory.
1. 



## Task 3: psreadline fine-tuning
1. Run this command: ```Get-Command -Module PSReadLine```
1. Run this command: ```Get-PSReadlineOption```
1. Get-PSReadlineKeyHandler
1. This command shows many keyboard combinations.


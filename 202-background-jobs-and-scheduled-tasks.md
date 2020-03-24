# background jobs

## Task 1: basic background jobs
1. Start a PowerShell console.
1. Run this command: ```Get-ChildItem -Path C:\ -Recurse```
1. This command might take a very long time. Abort the command using Ctrl-C.
1. Long-running command's might be good candidates to run as a background process.
1. Run this command: ```Start-Job { Get-ChildItem -Path C:\ -Recurse }```
1. Notice the output, specifically the Id.
1. Run this command to inspect all jobs: ```Get-Job```
1. The job will probably still be in a Running state.
1. In the meantime, start another job: ```Start-Job { Get-Service spooler }```
1. Run this command to inspect all jobs: ```Get-Job```
1. The last job will probably be in a Completed state. Notice the job Id of your final job.
1. Inspect the contents of the last job, replace the Id with the Id you noticed in the last step: ```Get-Job -Id 3```
1. get-job|gm
1. ```Get-Process PowerShell```
1. ```Start-Job { Get-Process PowerShell }```
1. ```Start-Job { Get-WmiObject Win32_BIOS -ComputerName LON-DC1 }```
1. ```Get-Job -Id 3``` with no parameters to see a list of jobs
1. ```Get-Job -Id 3 | Receive-Job –Keep```
1. ```Start-Job -ScriptBlock { sleep 20 }```
1. ```Get-Job -Id 9```
1. ```Wait-Job -Id 9``` will pause and wait for a job to complete
1. ```Remove-Job -Id 9``` Remove a completed job
1. ``Stop-Job -Id 13```

## FAN-OUT
1. ```Get-Command -parameter AsJob```
2. Check procmon op DC1
3. ```Invoke-Command { gwmi win32_bios } -comp lon-dc1, lon-cl1 -AsJob```
4. ```Start-Job { gps }``` notice jobnummering
5. ```$a = Get-Job <id>```
6. ```$a.childjobs```
7. ```Receive-Job <id> # NIET Get-Job <id> | Receive job```

## Scheduled Jobs
1. ```Get-Job | Remove-Job```
1. ```$trigger = New-JobTrigger –Once –At (Get-Date).AddMinutes(2)``` or -AtLogon
1. ```Register-ScheduledJob -Trigger $trigger { Get-Process | Export-CSV c:\p.csv } -Name MyJob```
1. optioneel: -ScheduledJobOption $option
1. ```$option = New-ScheduledJobOption -WakeToRun -RunElevated```
1. optioneel: -MaxResultCount 5
1. ```Get-Job``` # empty
1. ```Get-ScheduledJob | Select –Expand JobTriggers``` notice the Time
1. ```Get-ScheduledJob``` wait until after the time that was displayed in the previous step.
1. ```Get-Job``` wait
1. ```Receive-Job -name MyJob```


# Background jobs

## Task 1: basic background jobs
1. Start a PowerShell console.
1. Run this command: ```Get-ChildItem -Path C:\ -Recurse```
1. This command might take a very long time. Abort the command using Ctrl-C.
1. Long-running command's might be good candidates to run as a background process.
1. Run this command: ```Start-Job { Get-ChildItem -Path C:\ -Recurse }```
1. Notice the output, specifically the Id.
1. Start another job and store the job output in a variable: ```$myJob = Start-Job { Get-Service spooler }```
1. Run this command to inspect all jobs: ```Get-Job```
1. The first job will probably still be in a Running state. The last job will probably be in a Completed state. Notice the job Id of your final job.
1. Inspect the contents of the last job: ```$myJob | Receive-Job```
1. The output of the Get-Service command should be displayed.
1. Inspect the contents of the last job for the second time: ```$myJob | Receive-Job```
1. The output is emtpy. As soon as a Receive-Job command is run, the output of the job is emptied. When you receive job output, you should process it, store it in a variable, or store it on disk.
1. Start another job and store the job output in a second variable: ```$myJob2 = Start-Job { Get-ChildItem C:\ }```
1. Run this command to inspect the job object: ```$myJob2```
1. Repeat the last command until the Job state is Completed.
1. Inspect the contents of the job, while keeping the job output in the job: ```$myJob | Receive-Job -Keep```
1. Run this command to inspect all jobs: ```Get-Job```
1. Notice the Last job still has data, but the job before that doesn't. 
1. Run this command to inspect all jobs: ```Get-Job```
1. Run this command to list all completed jobs: ```Get-Job -State Completed```
1. Run this command to remove all completed jobs: ```Get-Job -State Completed | Remove-Job```
1. Run this command to list all running jobs: ```Get-Job -State Running```
1. Run this command to remove all running jobs: ```Get-Job -State Running | Remove-Job```
1. Warning: the Running jobs will be aborted.

1. ```Start-Job { Get-WmiObject Win32_BIOS -ComputerName LON-DC1 }```
1. ```Start-Job -ScriptBlock { sleep 20 }```
1. ```Get-Job -Id 9```
1. ```Wait-Job -Id 9``` will pause and wait for a job to complete
1. ```Remove-Job -Id 9``` Remove a completed job
1. ``Stop-Job -Id 13```


## Fan-out jobs
Some commands include an AsJob parameter. For example, you can create a job with the Invoke-Command command. 
1. Run this command to create a job that get's information from two computers: ```Invoke-Command { Get-WmiObject win32_bios } -ComputerName LON-DC1, LON-SVR1 -AsJob```
1. Run this command to inspect all jobs: ```Get-Job```
1. Run this command to inspect all jobs, including child jobs: ```Get-Job -IncludeChildJob```
1. Notice there is one main job, that started two child jobs. The two child jobs are running on the two remote computers LON-DC1 and LON-SVR1.
1. Get the output of the first child job. Replace the 2 with the number of your first child job: ```Receive-Job -Id 2 -Keep```
1. Get the output of the second child job. Replace the 3 with the number of your second child job: ```Receive-Job -Id 3 -Keep```
1. Now, get the output of all jobs. Replace the 1 with the number of you first job: ```Receive-Job -Id 1```


## Scheduled Jobs
In this task we're going to create a scheduled job, which is trigered by the operating system. So this job can be run in the middle of the night, for instance.
1. Run this job to create the trigger: ```$myTrigger = New-JobTrigger –Once –At (Get-Date).AddMinutes(3)```
1. Register the scheduled job with the operating system: ```Register-ScheduledJob -Trigger $myTrigger { Get-Process | Export-CSV C:\procs.csv } -Name ProcessListing```
1. Run this ocmmand to inspect the scheduled job: ```Get-ScheduledJob```
1. Wait until the time has elapsed that was displayed in the previous step.
1. Inspect the presence of the CSV file: ```Get-ChildItem C:\procs.csv```
1. If it's present, inspect the contents: ```Import-Csv C:\procs.csv```
1. This should display a process listing at the time the scheduled job was run.

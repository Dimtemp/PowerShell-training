# Background jobs

## Task 1: basic background jobs
1. Start a PowerShell console.
1. Run this command: ```Get-ChildItem -Path C:\ -Recurse```
1. This command might take a very long time. Abort the command using Ctrl-C.
1. Long-running commands might be good candidates to run as a background job.
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
1. Inspect the contents of the job, while keeping the job output in the job: ```$myJob2 | Receive-Job -Keep```
1. Run this command to inspect all jobs: ```Get-Job```
1. Notice the Last job still has data, but the job before that doesn't. 
1. Run this command to list all completed jobs: ```Get-Job -State Completed```
1. Run this command to remove all completed jobs: ```Get-Job -State Completed | Remove-Job```
1. Run this command to list all running jobs: ```Get-Job -State Running```
1. Run this command to remove all running jobs: ```Get-Job -State Running | Remove-Job -Force```
1. Beware that all running jobs will be aborted. Make sure you run this command on the lab computer.
1. Close the PowerShell console.


## Fan-out jobs
Some commands include an AsJob parameter. For example, you can create a job with using Invoke-Command. 
1. Open a new PowerShell console.
1. Run this command to create a job that retrieves information from two computers: ```Invoke-Command { Get-WmiObject win32_bios } -ComputerName LON-DC1, LON-SVR1 -AsJob```
1. Run this command to inspect all jobs: ```Get-Job```
1. Run this command to inspect all jobs, including child jobs: ```Get-Job -IncludeChildJob```
1. Notice there is one main job, that started two child jobs. The two child jobs are running on the two remote computers LON-DC1 and LON-SVR1.
1. Get the output of the first child job. Replace the 2 with the number of your first child job: ```Receive-Job -Id 2 -Keep```
1. Get the output of the second child job. Replace the 3 with the number of your second child job: ```Receive-Job -Id 3 -Keep```
1. Now, get the output of all jobs. Replace the 1 with the number of you first job: ```Receive-Job -Id 1```


## Scheduled Jobs
In this task we're going to create a scheduled job, which is triggered by the operating system. This job can be run in the middle of the night, for instance.
1. Run this job to create the trigger: ```$myTrigger = New-JobTrigger –Once –At (Get-Date).AddMinutes(3)```
1. A job trigger needs a time and date to run the job. (Get-Date).AddMinutes(3) creates a new datetime-object that's three minutes in the future. We're going to specify that object when creating the job. So make sure you complete the next command in three minutes.
1. Register the scheduled job with the operating system: ```Register-ScheduledJob -Trigger $myTrigger { Get-Process | Export-CSV C:\procs.csv } -Name ProcessListing```
1. Run this command to inspect the scheduled job: ```Get-ScheduledJob```
1. Wait until the time has elapsed that was displayed in the previous step.
1. Inspect the presence of the CSV file: ```Get-ChildItem C:\procs.csv```
1. If it's present, inspect the contents: ```Import-Csv C:\procs.csv```
1. This should display a process listing at the time the scheduled job was run.

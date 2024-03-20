# to do

## Task: monitor file changes
1. Create a folder to store the directory listing: ```mkdir C:\Listing```
1. Store a directory listing: ```Get-ChildItem -File | Export-Clixml \Listing\file-listing.xml```
1. del .\hello.txt
1. notepad .\procs.txt
1. $file1 = Import-Clixml .\data\file-vandaag.xml
1. $file2 = dir -file
1. Compare-Object $file1 $file2 -Property lastwritetime, name

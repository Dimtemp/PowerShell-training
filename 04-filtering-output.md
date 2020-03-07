# Task: basic filtering
Where-Object
-gt
-lt
-eq
-match
-like

1. ```Get-Process```

# Task: like and match
1. ```Get-Process | Where-Object ProcessName -match sh```
1. Note: if you don't get any output, try to use another text until you get a (preferred small) result.
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```
1. ```Get-Process```

# Task: filtering at the source
1. ```Get-Process -Name *sys*```
1. get-childitem -filter
1. get-wmiobject -filter
1. required filters: Some command's can generate a lot of load. To make the scripter be cautious 
1. get-adcomputer -filter
1. get-aduser -filter

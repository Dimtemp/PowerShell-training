# Working with date and time

## Task 1: using Get-Date
1. Run this command to display the current date and time: ```Get-Date```
1. Run this command to inspect the DateTime object: ```Get-Date | Get-Member```
1. Notice the Get-Date command produces a System.DateTime object (top of the Get-Member output). It has many intereseting methods and properties.
1. Run this command to store the date in a variable: ```$now = Get-Date```
1. Run this command to add 3 days to the current date: ```$now.AddDays(3)```
1. Notice the output should be 3 days in the future.
1. Run this command to add 30 days: ```$now.AddDays(30)```
1. Run this command to subtract 10 days: ```$now.AddDays(-10)```
1. Run this command to inspect the DateTime object: ```Get-Date | Get-Member```
1. Notice there are only Add-methods, no Subtract methods.
1. Run this command to display the current month: ```$now.Month```
1. Run this command to display the day of the year: ```$now.DayOfYear```
1. Run this command to display the current day of the week: ```$now.DayOfWeek```
1. Run this command to display a short date string: ```$now.ToShortDateString()```
1. Run this command to display the current universal time: ```$now.ToUniversalTime()```
1. Notice any differencse in your local time.
1. Run this command to display a long date string: ```$now.ToLongTimeString()```


## Task 2: working with timespans
1. Run this command to inspect the contents of the $now variable: ```$now```
1. Run this command to store the current datetime in a new variable: ```$later = Get-Date```
1. Run this command to subtract both objects: ```$later - $now```
1. You get a timespan object.
1. Store the timespan object in a variable: ```$timespan = $later - $now```
1. Retrieve several properties from your timespan object:
1. ```$timespan.TotalMinutes``` is the number of minutes that has elapsed.
1. ```$timespan.TotalSeconds``` is the number of seconds that has elapsed. Notice these two fields exclude each other.

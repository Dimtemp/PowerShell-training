# REST
Representational state transfer (REST) is a software architectural style that defines a set of constraints to be used for creating Web services. Web services that conform to the REST architectural style, called RESTful Web services, provide interoperability between computer systems on the internet. RESTful Web services allow the requesting systems to access and manipulate textual representations of Web resources by using a uniform and predefined set of stateless operations. 

1. Enter this command to store a URL in a variable: ```$url = 'https://ipinfo.io/json'```
1. Please notice that the URL is making a reference to json. The reply might contain JSON-formatted data.
1. Enter this command to retrieve the contents behind the URL: ```$r = Invoke-WebRequest $url```
1. Inspect the variable: ```$r```
1. Notice the content property.
1. Inspect the content property: ```$r.content```
1. You can convert the textual output to JSON using this command: ```$r.content | ConvertFrom-Json```
1. Since the url is offers data in json, we can use a more direct way to retrieve data: ```Invoke-RestMethod $url```
1. Notice the output is already a PowerShell object.
1. Repeat the previous command using this URL: ```$url = 'https://www.metaweather.com/api/location/727232'```
1. Repeat the previous command using this URL: ```$url = 'https://restcountries.eu/rest/v2/all' }
1. Try to filter the output to only show the country you're currently in.

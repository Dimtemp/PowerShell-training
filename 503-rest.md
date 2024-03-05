# Representational state transfer (REST)
## Note! In this exercise we rely on external APIs and information sources. There is no guarantee that these services are currently available, or work as expected.

Representational state transfer (REST) is a software architectural style that defines a set of constraints to be used for creating Web services. Web services that conform to the REST architectural style, called RESTful Web services, provide interoperability between computer systems on the internet. RESTful Web services allow the requesting systems to access and manipulate textual representations of Web resources by using a uniform and predefined set of stateless operations. 

## IP Info
1. Enter this command to store a URL in a variable: ```$url = 'https://ipinfo.io/json'```
1. Please notice that the URL is making a reference to json. The reply might contain JSON-formatted data.
1. Enter this command to retrieve the contents behind the URL: ```$r = Invoke-WebRequest $url```
1. Inspect the variable: ```$r```
1. Notice the content property.
1. Inspect the content property: ```$r.content```
1. You can convert the textual output to JSON using this command: ```$r.content | ConvertFrom-Json```
1. Since the service offers data in JSON, we can use a more direct way to retrieve data: ```Invoke-RestMethod $url```
1. Notice the output is already a PowerShell object. This only works for services that reply in JSON.

## Spot the International Space Station (ISS)
1. Enter this command to store a URL in a variable: ```$url = 'https://api.wheretheiss.at/v1/satellites/25544'```
1. Since the service offers data in JSON, we can use the Invoke-RestMethod command to retrieve data: ```Invoke-RestMethod $url```
1. Notice the visibility property. Eclipsed means you cannot see the ISS at this moment. If it displays 'daylight' it means you might be able to see it, but it will be very faint.
1. You might be able to determine the visibility for you 
1. You can optionally visit the corresponding website to visualize the location of the ISS. This should correspond to the visibility property from the previous command: ```https://wheretheiss.at/```

# Space launches
1. Enter this command to store a URL in a variable: ```$url = 'https://ll.thespacedevs.com/2.2.0/launch/'```
1. Since the service offers data in JSON, we can use the Invoke-RestMethod command to retrieve data: ```$r = Invoke-RestMethod $url```
1. Inspect the variable: ```$r```
1. Notice the count property (there should be MANY in the launch database).
1. Inspect the results property: ```$r.results```

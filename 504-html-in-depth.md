# HTML files in-depth

to do: add content

Get-Process | Select ws, ProcessName | Sort-Object ws -Desc | Select-Object -First 10 | ConvertTo-HTML -fragment | Out-File report.html -Append

metaweather to html
include icons, documented on metaweather website
space launches to html

"Heavy Cloud" -replace "Heavy Cloud", <img src="/static/img/weather/X.svg" alt="Heavy Cloud">

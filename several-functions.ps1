# several  functions to demonstrate during class

function Get-ProcessTopMemory {
    param(
        $top=10
    )
    Get-Process | Sort-Object ws | Select-Object -first $top
}



# tbv auto loading module
function motd {
    Write-Host "with great power comes great responsibility"
}



function Invoke-Speak {
    param($message='Great programmers never die. They just decompile.')
    $a = New-Object -ComObject SAPI.SpVoice
    $a.Volume = 100
    $a.Rate = 0 # -10 tot 10
    $a.Speak($Message)
}
# gebruik motd als input



function Show-SystemUsage {
    $os = Get-CimInstance Win32_OperatingSystem
    "{0:N2} GB Memory" -f ($os.TotalVisibleMemorySize/1MB)

    Get-CimInstance Win32_LogicalDisk -Filter 'DriveType = 3' | ForEach-Object {
        "{0:N1} GB {1}" -f ($_.Size/1GB), $_.DeviceID
    }
}




function Get-ServiceMemoryUsage {
    <#
    .SYNOPSIS
    Returns memory usage of a service
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        $ServiceName
    )

    $svc = Get-CimInstance win32_service | 
    Where-Object Name -like $ServiceName | 
    Where-Object State -eq Running

    if(!$svc) { throw "Service $ServiceName not found or not running" }

    $proc = Get-Process | Where-Object Id -eq $svc.ProcessId
    write-host $proc

    $HashParams = @{
        Name = $svc.Name
        WS   = $proc.WS
    }

    New-Object PSObject -Property $HashParams
}


function Get-IpInfo {
    Invoke-RestMethod 'https://ipinfo.io/json'
    # output contains GPS coords comma-separated and .-decimal thousands separator
}

function Get-ISS {
    Invoke-RestMethod 'http://api.wheretheiss.at/v1/satellites/25544'
    # output contains GPS coords in a different format as compared to Get-IpInfo
}

# combine previous two demos to calculate distance between my IP adres and the ISS using Get-GeoDistance


function Get-GeoDistance {
    <#
    .EXAMPLE
    Get-GeoDistance -latitude1 52 -longitude1 4 -latitude2 40 -longitude2 -74
    .NOTES
    BETA! Not tested yet!
    #>
    param (
        [string]$latitude1,
        [string]$longitude1,
        [string]$latitude2,
        [string]$longitude2,
        [double]$Radius = 6371   # Earth's radius in kilometers
    )

    # Convert degrees to radians
    $dLat = ($latitude2 - $latitude1) * [Math]::PI / 180
    $dLon = ($longitude2 - $longitude1) * [Math]::PI / 180
    $latitude1 = $latitude1 * [Math]::PI / 180
    $latitude2 = $latitude2 * [Math]::PI / 180

    $a = [Math]::Sin($dLat / 2) * [Math]::Sin($dLat / 2) +
         [Math]::Cos($latitude1) * [Math]::Cos($latitude2) *
         [Math]::Sin($dLon / 2) * [Math]::Sin($dLon / 2)
    $c = 2 * [Math]::Atan2([Math]::Sqrt($a), [Math]::Sqrt(1-$a))
    
    $distance = $Radius * $c
    return $distance
}




function MultiPing {
    param($computername)
    $computername | ForEach-Object {
        $r = Test-Connection $_ -Count 1 -ErrorAction SilentlyContinue # -Quiet geeft geen responsetime
        if     ($r.ResponseTime -ge $10) { write-host $_ -ForegroundColor Red }
        elseif ($r.ResponseTime -ge $5)  { write-host $_ -ForegroundColor Yellow }
        else                             { write-host $_ }
    }
}



function ProcessMonitor {
    # a bit more complex
    $procs1 = Get-Process
    do {
        # mspaint
        Start-Sleep 1
        $procs2 = Get-Process
        $diff = Compare-Object $procs1 $procs2 -Property ProcessName
        $diff | ForEach-Object {
            if ($_.sideIndicator -eq "=>") { Write-Host $_.ProcessName -foregroundcolor green  }
            if ($_.sideIndicator -eq "<=") { Write-Host $_.ProcessName -foregroundcolor yellow }
        }
        $procs1 = $procs2
    }
}

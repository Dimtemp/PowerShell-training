function Get-ArchitectureInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string[]]$ComputerName
    )
    PROCESS {
        foreach ($computer in $computername) {
            # All CPUs should be the same so only get one
            $proc = Get-CimInstance -ClassName Win32_Processor -ComputerName $computer |
                     Select-Object -first 1

            $os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computer

            $properties = @{'ComputerName'=$Computer;
                            'OSArchitecture'=$os.osarchitecture;
                            'ProcArchitecture'=$proc.addresswidth}
            $obj = New-Object -TypeName PSObject -Property $properties
            Write-Output $obj
        }
    }
}

# expecting to see all computers listed in output
# since they are 64-bit CPUs and 64-bit operating systems
Get-ArchitectureInfo -ComputerName LON-SVR1,LON-DC1 |
Where-Object { $_.ProcArchitecture -eq $_.OSArchitecture } |
Select-Object -Property ComputerName

# But we get no output

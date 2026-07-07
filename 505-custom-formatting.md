# Custom format demo

Create a PowerShell module with the following function:
```
function Get-ComputerInfo {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $sysdrive = $os.SystemDrive

    $cs = Get-CimInstance Win32_ComputerSystem

    $drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceId='$sysdrive'"

    $proc = Get-CimInstance Win32_Processor |
        Select-Object -First 1

    $props = [ordered]@{
        'ComputerName'=$cs.name
        'Manufacturer'=$cs.manufacturer
        'Model'=$cs.model
        'Processors'=$cs.numberofprocessors
        'Cores'=$cs.numberoflogicalprocessors
        'RAM'=$cs.totalphysicalmemory
        'Architecture'=$proc.addresswidth
        'SysDriveFreeSpace'=$drive.freespace
        'OSCaption'=$os.caption
        'OSVersion'=$os.version
        'SPVersion'=$os.servicepackmajorversion
        'OSBuild'=$os.buildnumber
    }
    $obj = New-Object -TypeName PSObject -Property $props
    $obj.psobject.typenames.insert(0, 'CFDemo.ComputerInfo')
    Write-Output $obj
}
```

Create a module manifest file:
```json
@{
RootModule = 'CFDemo.psm1'
ModuleVersion = '1.0'
GUID = 'd17d4b9a-5d03-46de-a472-d7e02d637427'
Author = 'Dimitri Koens'
FormatsToProcess = @('.\CFDemoView.Format.ps1xml')
FunctionsToExport = '*'
}
```

Create a PS1XML file witht the following contents:

```xml
<?xml version="1.0" encoding="utf-8"?>
<Configuration>
  <ViewDefinitions>

    <View>
      <Name>DemoComputerTable</Name>

      <ViewSelectedBy>
        <TypeName>Demo.Computer</TypeName>
      </ViewSelectedBy>

      <TableControl>

        <TableHeaders>
          <TableColumnHeader><Label>Name</Label></TableColumnHeader>
          <TableColumnHeader><Label>Status</Label></TableColumnHeader>
          <TableColumnHeader><Label>CPU</Label></TableColumnHeader>
          <TableColumnHeader><Label>Memory</Label></TableColumnHeader>
          <TableColumnHeader><Label>Uptime</Label></TableColumnHeader>
        </TableHeaders>

        <TableRowEntries>
          <TableRowEntry>
            <TableColumnItems>

              <TableColumnItem>
                <PropertyName>Name</PropertyName>
              </TableColumnItem>

              <TableColumnItem>
                <PropertyName>Status</PropertyName>
              </TableColumnItem>

              <TableColumnItem>
                <PropertyName>CPU</PropertyName>
              </TableColumnItem>

              <TableColumnItem>
                <PropertyName>Memory</PropertyName>
              </TableColumnItem>

              <TableColumnItem>
                <PropertyName>Uptime</PropertyName>
              </TableColumnItem>

            </TableColumnItems>
          </TableRowEntry>
        </TableRowEntries>

      </TableControl>

    </View>

  </ViewDefinitions>
</Configuration>
```

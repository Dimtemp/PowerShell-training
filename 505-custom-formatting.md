# Custom format demo

In this section you're going to create a function with a custom formatting. 

Let's start with creating a PowerShell module file with the following function:

```powershell
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
    # uncomment this later $obj.psobject.typenames.insert(0, 'CFDemo.ComputerInfo')
    Write-Output $obj
}
```

1. Store it as CFDemo.psm1.
2. Load the file using Import-Module.
3. Run the function Get-ComputerInfo
4. Notice the output as a list.
5. Now format the output as a table using Get-ComputerInfo | Format-Table
6. You can see the table is (probably) too wide for the screen, and information gets truncated.
7. Now create a module manifest file with the following name: CFDemo.psd1

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

1. Create a CFDemoView.Format.ps1xml file with the following contents:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<Configuration>
    <ViewDefinitions>

        <View>
            <Name>MachineInfo</Name>
            <ViewSelectedBy>
                <TypeName>CFDemo.ComputerInfo</TypeName>
            </ViewSelectedBy>

            <TableControl>
                <TableHeaders>

                    <TableColumnHeader>
                        <Label>ComputerName</Label>
                    </TableColumnHeader>

                    <TableColumnHeader>
                        <Label>Model</Label>
                    </TableColumnHeader>

                    <TableColumnHeader>
                        <Label>Cores</Label>
                        <Alignment>Right</Alignment>
                    </TableColumnHeader>

                    <TableColumnHeader>
                        <Label>RAM(G)</Label>
                        <Alignment>Right</Alignment>
                    </TableColumnHeader>

                    <TableColumnHeader>
                        <Label>OperatingSystem</Label>
                    </TableColumnHeader>

                </TableHeaders>

                <TableRowEntries>
                    <TableRowEntry>
                        <TableColumnItems>

                            <TableColumnItem>
                                <PropertyName>ComputerName</PropertyName>
                            </TableColumnItem>

                            <TableColumnItem>
                                <PropertyName>Model</PropertyName>
                            </TableColumnItem>

                            <TableColumnItem>
                                <PropertyName>Cores</PropertyName>
                            </TableColumnItem>

                            <TableColumnItem>
                                <ScriptBlock>'{0:N0} GB' -f ($_.RAM / 1GB)</ScriptBlock>
                            </TableColumnItem>

                            <TableColumnItem>
                                <PropertyName>OSCaption</PropertyName>
                            </TableColumnItem>

                        </TableColumnItems>
                    </TableRowEntry>
                 </TableRowEntries>
            </TableControl>
        </View>   

    </ViewDefinitions>
</Configuration>

```

1. Finally, import the module again. Use the Force parameter to reload it from disk: Import-Module CFDemo.psd1
2. Run the function Get-ComputerInfo
3. Notice the table showing five columns. PowerShell shows a list, instead of a table, when more than four properties are part of the output, unless a format-file (ps1xml) is loaded.
4. Run the function again, now using Get-Member to show other properties are available: Get-ComputerInfo | Get-Member
5. Finally, run the function using all properties in the output: Get-ComputerInfo | Select-Object *

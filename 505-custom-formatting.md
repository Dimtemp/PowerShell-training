


PS1XML file
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


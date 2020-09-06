# Install-Module Az
# Connect-AzAccount

function New-AzVMForPowerShellTraining {

    param(
        $DomainNameLabel = (Read-Host -Title 'Domain Name label')
    )

    $vnet = Get-AzVirtualNetwork | Out-GridView -OutputMode single -Title 'Select domain controller vnet'
    $subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet
    if ($subnet.count -NE 1) { throw 'Domain controller vnet should contain only one subnet' }

    $AzVMArguments = @{
        Name = 'VM' + (Get-Random -Maximum 1000000)
        ResourceGroupName = $vnet.ResourceGorupName
        DataDiskSizeInGb = 2
        VirtualNetworkName = $vnet.name
        SubnetName = $subnet.name
        OpenPorts = 443
        DomainNameLabel = ''
    }

    New-AzVM $AzVMArguments
}


New-AzVMForPowerShellTraining -DomainNameLabel 'testdomain.com'


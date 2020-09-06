function New-AzVMForPowerShellTraining {

    [cmdletbinding()]
    param(
        $VMName = 'pwshvm' + (Get-Random -Maximum 1000000),
        $DomainNameLabel = (Read-Host -Title 'Domain Name label'),
        $username = (Read-Host -Title 'username'),
        $Password = 'Pa55w.rd1234'
    )

    $vnet = Get-AzVirtualNetwork | Out-GridView -OutputMode single -Title 'Select domain controller vnet'
    if ($vnet.count -gt 1) { $vnet = $vnet | Out-GridView -OutputMode single -Title 'Select domain controller vnet' }

    $subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet
    if ($subnet.count -NE 1) { throw 'Domain controller vnet should contain only one subnet' }

    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
    $Cred = New-Object System.Management.Automation.PSCredential ($username, $securePassword)

    $AzVMArguments = @{
        Name = $VMName
        ResourceGroupName = $VMName
        DataDiskSizeInGb = 2
        VirtualNetworkName = $vnet.name
        SubnetName = $subnet.name
        OpenPorts = 3389
        DomainNameLabel = $VMName   #  ???.eastus.cloudapp.azure.com
        Credential  = $Cred
        #AsJob = $true
        #Location by default same as vnet
        #Size Standard_DS1_v2 (1 vcpus, 3.5 GiB memory)
        #Image Win2016Datacenter (default), Win2012R2Datacenter, UbuntuLTS, Debian, ...
        #Priority = 'Spot' # spot instance
        #EvictionPolicy = 'Deallocate' # (or 'Delete')
    }

    write-verbose @AzVMArguments

    New-AzVM @AzVMArguments
}

New-AzVMForPowerShellTraining -DomainNameLabel 'powershell.lan'

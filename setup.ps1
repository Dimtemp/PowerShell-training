function New-AzVMForPowerShellTraining {

    [cmdletbinding()]
    param(
        $VMName = 'pwshvm' + (Get-Random -Maximum 1000000),
        $DomainNameLabel = (Read-Host -Title 'Domain Name label'),
        $username = (Read-Host -Title 'username'),
        $Password = 'Pa55w.rd1234'
    )

    $vnet = Get-AzVirtualNetwork # | Out-GridView -OutputMode single -Title 'Select domain controller vnet'
    if ($vnet.count -gt 1) { $vnet = $vnet | Out-GridView -OutputMode single -Title 'Select domain controller vnet' }

    $subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet
    if ($subnet.count -NE 1) { $subnet = $subnet | Out-GridView -OutputMode Single -Title 'Select subnet' }

    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
    $Cred = New-Object System.Management.Automation.PSCredential ($username, $securePassword)

    $AzVMArguments = @{
        Name = $VMName
        ResourceGroupName = $vnet.ResourceGroupName # prefer $VMName, if other name then also new vnet
        DataDiskSizeInGb = 2
        VirtualNetworkName = $vnet.name
        SubnetName = $subnet.name
        OpenPorts = 3389
        DomainNameLabel = $VMName   #  ???.westeurope.cloudapp.azure.com
        Credential  = $Cred
        AsJob = $true
        #Location by default same as vnet
        #Size = Standard_DS1_v2 (1 vcpus, 3.5 GiB memory) Get-AzVMSize -location westeurope | where numberofcores -lt 2 | sort MemoryInMB
        #Image Win2016Datacenter (default), Win2012R2Datacenter, UbuntuLTS, Debian, ...
        #Priority = 'Spot' # spot instance
        #EvictionPolicy = 'Deallocate' # (or 'Delete')
    }

    Write-Verbose @AzVMArguments

    New-AzVM @AzVMArguments
}

#Install-Module Az
#Connect-AzAccount
# Max 10 IPs per subscription per region!
1..9 | foreach {
    New-AzVMForPowerShellTraining -DomainNameLabel 'powershell.lan' -username 'student' -VMName pwshvm$_  -Verbose
}


<#
New-AzVM
   [[-Zone] <System.String[]>] 
   [-AddressPrefix <System.String>] 
   [-AllocationMethod {Static | Dynamic}] 
   [-AvailabilitySetName <System.String>] 
   [-DefaultProfile <Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer>] 
   [-EnableUltraSSD] 
   [-HostId <System.String>] 
   [-MaxPrice <System.Double>]
   [-EncryptionAtHost] 
   [-ProximityPlacementGroupId <System.String>] 
   [-PublicIpAddressName <System.String>] 
   [-SecurityGroupName <System.String>] 
   [-SubnetAddressPrefix <System.String>]  
   [-SystemAssignedIdentity] 
   [-UserAssignedIdentity <System.String>]    
#>

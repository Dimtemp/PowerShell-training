function New-AzVMForPowerShellTraining {

    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ResourceGroupName,

        [string]$VMName = 'pwshvm' + (Get-Random -Maximum 1000000),

        [Parameter(Mandatory=$true)]
        [string]$DomainNameLabel,

        [string]$UserName = 'Student',
        [string]$Password = 'Pa55w.rd1234',

        [string]$Image = 'Win2019Datacenter', # or Win2022AzureEditionCore Win2016Datacenter (default), Win2012R2Datacenter, UbuntuLTS, Debian, ...
        
        [switch]$AsJob
    )

    $vnet = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroupName
    if ($vnet.count -gt 1) { $vnet = $vnet | Out-GridView -OutputMode single -Title 'Select domain controller vnet' }
    if ($vnet.DhcpOptions.dnsservers[0] -ne '10.0.0.4') {
        Write-Warning 'VNET DNS server has not (yet) been set to 10.0.0.4'
    }

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
        PublicIpSku = 'Standard'
        OpenPorts = 3389
        DomainNameLabel = $VMName   #  ???.westeurope.cloudapp.azure.com
        Credential  = $Cred
        # AsJob = $AsJob
        Image = $Image
        # SecurityType = 'Standard'   # or TrustedLaunch, ConfidentialVM
        #Location by default same as vnet
        #Size = Standard_DS1_v2 (1 vcpus, 3.5 GiB memory) Get-AzVMSize -location westeurope | where numberofcores -lt 2 | sort MemoryInMB
        #Priority = 'Spot' # spot instance
        #EvictionPolicy = 'Deallocate' # (or 'Delete')
    }

    Write-Verbose ($AzVMArguments | Out-String)

    New-AzVM @AzVMArguments

    # this command works:
    # New-AzVM -Name testvm -ResourceGroupName $resourceGroupName -DataDiskSizeInGb 2 -VirtualNetworkName $vnet.name -SubnetName adSubnet -PublicIpSku 'Standard' -OpenPorts 3389 -DomainNameLabel testvm -Credential $Cred -OpenPorts 3389 -Image Win2019Datacenter
}

<#
Make sure DC exists in powershell.lan domain
JSON template deploy: https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azdeployment?view=azps-4.8.0
$location = 'west europe'
resourceGroupName =  'tst-eu-training-01' # 'pwsn-weu'

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri "https://raw.githubusercontent.com/Azure/azure-quick-start-templates/master/101-sql-logical-server/azuredeploy.json" -administratorLogin $adminUser -administratorLoginPassword $adminPassword

For Azure VM:
password between 8-123 characters long and 
3 of complexity requirements:
1) Contains an uppercase character 
2) Contains a lowercase character 
3) Contains a numeric digit 
4) Contains a special character

Create DC:
https://github.com/Azure/azure-quickstart-templates/tree/master/application-workloads/active-directory/active-directory-new-domain
or optionally: 
https://github.com/Azure/azure-quickstart-templates/tree/master/application-workloads/active-directory/create-ad-forest-with-subdomain

Install-Module Az
Connect-AzAccount
Get-AzSubscription | Where name -match 'somename' | Select-AzSubscription
Max 10 IPs per subscription per region!
#>

# Create VMs
1..9 | ForEach-Object { New-AzVMForPowerShellTraining -DomainNameLabel 'powershell.lan' -VMName pwshvm$_ -Verbose -ResourceGroupName $resourceGroupName }

# join to domain  (this works on running VM)
1..9 | ForEach-Object { Set-AzVMADDomainExtension -DomainName 'powershell.lan' -Restart -ResourceGroupName $resourceGroupName -VMName "pwshvm$_" }
# or New-AzureServiceADDomainExtensionConfig
# or Add-Computer 'PowerShell.lan' -Restart -Credential (Get-Credential -UserName 'powershell\dimitri' -Message 'domain admin')



# retrieve public IPs and FQDN
Get-AzPublicIpAddress | Select-Object resourcegroupname, name, location, ProvisioningState, PublicIpAllocationMethod, IpAddress, @{n='Fqdn'; e={$_.DnsSettings.Fqdn}} | Format-Table -AutoSize

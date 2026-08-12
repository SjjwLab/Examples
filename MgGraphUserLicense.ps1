# Objective: View available licenses, add or remove licenses from users
# Use:

Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Users.Actions
Connect-MgGraph -Scopes "User.ReadWrite.All", "Organization.Read.All"

# List available tenant SKUs: 
Get-MgSubscribedSku | Select-Object SkuPartNumber, SkuId, @{Name="Total";Expression={$_.PrepaidUnits.Enabled}}, ConsumedUnits

# View user license details: 
Get-MgUserLicenseDetail -UserId "user@domain.xyz"

# Assign a license: 
Set-MgUserLicense -UserId "user@domain.xyz" -AddLicenses @{SkuId = "cbdc14ab-d96c-4c30-b9f4-6ada7cdc1d46"} -RemoveLicenses @() 

# Remove a license:
# Set-MgUserLicense -UserId "user@domain.xyz" -RemoveLicenses @("cbdc14ab-d96c-4c30-b9f4-6ada7cdc1d46") -AddLicenses @()
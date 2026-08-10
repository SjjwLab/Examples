# Install the official Microsoft Entra module
#Install-Module -Name Microsoft.Entra -Scope CurrentUser

Import-Module Microsoft.Entra.Authentication

# Connect to your Entra ID tenant
Connect-Entra -scopes 'User.ReadWrite.All'

# Delete using the User Principal Name
Remove-EntraUser -UserId "AveryI@0989796.xyz"

# Alternatively, delete using the unique ObjectId
# Remove-EntraUser -UserId "abcd1234-5678-90ab-cdef-1234567890ab"
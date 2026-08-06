# Creating Users in Entra ID using PowerShell

# Prerequisites:
# - Ensure you have the AzureAD or Microsoft Graph PowerShell module installed.
# - You must have the necessary permissions to create users in Entra ID.
# # Usage:
# 1. Open PowerShell with administrative privileges.
# 2. Run the script and provide the required user details as prompted.

<# # Using MgGraph
##Connect-MgGraph -Scopes "User.ReadWrite.All"
Install-Module Microsoft.Graph -Scope CurrentUser

Connect-MgGraph -Scopes "User.ReadWrite.All"

# 1. Define the temporary password profile
$PasswordProfile = @{
    Password = "SecurePassword123!"
    ForceChangePasswordNextSignIn = $true
}

# 2. Create the new user
New-MgUser -DisplayName "Jane Doe" `
           -MailNickname "jdoe" `
           -UserPrincipalName "jdoe@yourdomain.com" `
           -AccountEnabled $true `
           -PasswordProfile $PasswordProfile;

##################################################################
# Or using Microsoft.Entra ID module
##################################################################

Install-Module Microsoft.Entra -Scope CurrentUser

Connect-Entra -Scopes "User.ReadWrite.All"

# 1. Define the password profile
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "SecurePassword123!"

# 2. Create the new user
New-EntraUser -DisplayName "Jane Doe" `
              -MailNickname "jdoe" `
              -UserPrincipalName "jdoe@yourdomain.com" `
              -AccountEnabled $true `
              -PasswordProfile $PasswordProfile;
 #>
 

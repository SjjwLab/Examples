# Objective: Change EntraID User Password
# Use: Use Powershell to change an EntraID user's password

# Install-Module Microsoft.Entra.Authentication -Scope CurrentUser -Force -AllowClobber
Import-Module Microsoft.Entra.Authentication

# Connect to Entra ID with the necessary scopes for password management
Connect-Entra -Scopes 'User.ReadWrite.All', 'User-PasswordProfile.ReadWrite.All', 'UserAuthenticationMethod.ReadWrite.All', 'Directory.ReadWrite.All'

# Create a secure password and set it for the user
$PasswordText = "YourStrongPassword123!"
$SecurePassword = ConvertTo-SecureString $PasswordText -AsPlainText -Force
Set-EntraUserPasswordProfile -UserId "<USER_ID>" -Password $securePassword


# Require user to change password on next login
# Set-EntraUserPasswordProfile -UserId "<USER_ID>" -Password $SecurePassword -ForceChangePasswordNextSignIn $true
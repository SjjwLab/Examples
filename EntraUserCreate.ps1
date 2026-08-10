# Objective:Creating Users in Entra ID using PowerShell
# Use: Create individual or batches of users in Entra ID using PowerShell

#Install-Module -Name Microsoft.Entra -Scope CurrentUser -AllowClobber
Import-Module Microsoft.Entra.Authentication
Connect-Entra -Scopes 'User.ReadWrite.All'
$passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$passwordProfile.Password = 'StrongPassword123!'
$userParams = @{
    DisplayName       = '<DISPLAYNAME>'
    PasswordProfile   = $passwordProfile
    UserPrincipalName = '<EMAILADDRESS>'
    AccountEnabled    = $true
    MailNickName      = '<MAILNICKNAME>'
    UsageLocation    = 'US'
}

New-EntraUser @userParams
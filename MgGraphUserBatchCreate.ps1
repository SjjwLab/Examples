# Objective: Batch create users 
# Use: Use MgGpraph to create a batch of users from CSV file.

# Install-Module Microsoft.Graph -Force
Import-Module Microsoft.Graph.Authentication -Force
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Specify User CSV file path
$CSVPath = "C:\Users\steve\Downloads\Employees.csv"

# Create password profile
$PasswordProfile = @{
    Password                             = "P@ssw0rd!"
    ForceChangePasswordNextSignIn        = $true
    ForceChangePasswordNextSignInWithMfa = $true
}

# Import the CSV file containing user details
$Users = Import-Csv -Path $CSVPath

# Loop through each row in the CSV file
foreach ($User in $Users) {
    $UserParams = @{
        DisplayName       = $User.DisplayName
        GivenName         = $User.FirstName
        Surname           = $User.LastName
        UserPrincipalName = $User.UserPrincipalName
        UsageLocation     = $User.UsageLocation
        MailNickname      = $User.MailNickname
        Department        = $User.Department
        PasswordProfile   = $PasswordProfile
        AccountEnabled    = $true
    }
    try {
        New-MgUser @UserParams -ErrorAction Stop | Out-Null
        Write-Host "Successfully processed $($user.UserPrincipalName)" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to process $($user.UserPrincipalName). Error: $_"
    }
}
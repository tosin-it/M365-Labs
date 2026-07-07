Connect-MgGraph -Scopes "User.ReadWrite.All"

$Users = Import-Csv "..\Data\Users.csv"

$PasswordProfile = @{
    ForceChangePasswordNextSignIn = $true
    Password = 'P@ssw0rd123!'
}

$Success = 0
$Failed = 0

foreach ($User in $Users) {

    Write-Host "Processing $($User.DisplayName)..." -ForegroundColor Cyan

    $ExistingUser = Get-MgUser -Filter "userPrincipalName eq '$($User.UserPrincipalName)'" -ErrorAction SilentlyContinue

    if ($ExistingUser) {
        Write-Host "User already exists. Skipping." -ForegroundColor Yellow
        continue
    }

    try {

        New-MgUser `
            -DisplayName $User.DisplayName `
            -GivenName $User.GivenName `
            -Surname $User.Surname `
            -UserPrincipalName $User.UserPrincipalName `
            -MailNickname $User.MailNickname `
            -Department $User.Department `
            -JobTitle $User.JobTitle `
            -AccountEnabled `
            -PasswordProfile $PasswordProfile

        Write-Host "Created successfully." -ForegroundColor Green
        $Success++

    }

    catch {

        Write-Host "Failed: $($_.Exception.Message)" -ForegroundColor Red
        $Failed++

    }

}

Write-Host ""
Write-Host "Completed."
Write-Host "Successful: $Success"
Write-Host "Failed: $Failed"
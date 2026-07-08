Connect-MgGraph -Scopes "User.ReadWrite.All","Organization.Read.All"

# Import users
$Users = Import-Csv "..\Data\Users.csv"

# Retrieve the Microsoft 365 E5 SKU (adjust if needed)
$License = Get-MgSubscribedSku |
Where-Object {$_.SkuPartNumber -eq "ENTERPRISEPREMIUM"}

if (-not $License) {
    Write-Host "License SKU not found. Update the SkuPartNumber in the script." -ForegroundColor Red
    exit
}

$SkuId = $License.SkuId

$Success = 0
$Skipped = 0
$Failed = 0

foreach ($User in $Users) {

    try {

        $GraphUser = Get-MgUser -UserId $User.UserPrincipalName -Property Id,DisplayName,AssignedLicenses

        if ($GraphUser.AssignedLicenses.SkuId -contains $SkuId) {

            Write-Host "$($User.DisplayName) already licensed." -ForegroundColor Yellow
            $Skipped++
            continue

        }

        Set-MgUserLicense `
            -UserId $GraphUser.Id `
            -AddLicenses @(
                @{
                    SkuId = $SkuId
                }
            ) `
            -RemoveLicenses @()

        Write-Host "$($User.DisplayName) licensed successfully." -ForegroundColor Green

        $Success++

    }

    catch {

        Write-Host "Failed: $($User.DisplayName)" -ForegroundColor Red
        Write-Host $_.Exception.Message

        $Failed++

    }

}

Write-Host ""
Write-Host "========== Summary ==========" -ForegroundColor Cyan
Write-Host "Licensed : $Success"
Write-Host "Skipped  : $Skipped"
Write-Host "Failed   : $Failed"
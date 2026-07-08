Connect-MgGraph -Scopes "Group.ReadWrite.All","User.Read.All"

# Import data
$Groups = Import-Csv "..\Data\Groups.csv"
$Users  = Import-Csv "..\Data\Users.csv"

# Department-to-group mapping
$DepartmentMap = @{
    "IT"          = "IT Department"
    "Finance"     = "Finance Department"
    "HR"          = "HR Department"
    "Sales"       = "Sales Department"
    "Engineering" = "Engineering Department"
}

Write-Host "`n========== Creating Security Groups ==========" -ForegroundColor Cyan

foreach ($Group in $Groups) {

    $ExistingGroup = Get-MgGroup -Filter "displayName eq '$($Group.DisplayName)'"

    if (-not $ExistingGroup) {

        New-MgGroup `
            -DisplayName $Group.DisplayName `
            -MailEnabled:$false `
            -MailNickname $Group.MailNickname `
            -SecurityEnabled:$true `
            -Description $Group.Description

        Write-Host "Created group: $($Group.DisplayName)" -ForegroundColor Green
    }
    else {

        Write-Host "Group already exists: $($Group.DisplayName)" -ForegroundColor Yellow

    }
}

Write-Host "`n========== Assigning Users ==========" -ForegroundColor Cyan

foreach ($User in $Users) {

    try {

        $GraphUser = Get-MgUser -UserId $User.UserPrincipalName -ErrorAction Stop

        $GroupName = $DepartmentMap[$User.Department]

        if ([string]::IsNullOrWhiteSpace($GroupName)) {

            Write-Host "No mapping found for department $($User.Department)." -ForegroundColor Yellow
            continue

        }

        $Group = Get-MgGroup -Filter "displayName eq '$GroupName'"

        # Check if user is already a member
        $ExistingMember = Get-MgGroupMember -GroupId $Group.Id -All |
            Where-Object Id -eq $GraphUser.Id

        if ($ExistingMember) {

            Write-Host "$($GraphUser.DisplayName) already belongs to $GroupName" -ForegroundColor Yellow

        }
        else {

            New-MgGroupMemberByRef `
                -GroupId $Group.Id `
                -BodyParameter @{
                    "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$($GraphUser.Id)"
                }

            Write-Host "$($GraphUser.DisplayName) added to $GroupName" -ForegroundColor Green

        }

    }

    catch {

        Write-Host "Failed processing $($User.DisplayName): $($_.Exception.Message)" -ForegroundColor Red

    }

}

Write-Host "`n========== Completed ==========" -ForegroundColor Cyan
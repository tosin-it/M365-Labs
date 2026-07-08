Connect-MgGraph -Scopes `
"User.Read.All",
"Group.Read.All",
"Directory.Read.All",
"DeviceManagementManagedDevices.Read.All",
"Organization.Read.All"

$ReportFolder = "..\Reports"

if (!(Test-Path $ReportFolder)) {
    New-Item -ItemType Directory -Path $ReportFolder | Out-Null
}

Write-Host "Exporting Users..."

Get-MgUser -All |
Select-Object DisplayName,
UserPrincipalName,
Department,
JobTitle,
AccountEnabled |
Export-Csv "$ReportFolder\Users.csv" -NoTypeInformation

Write-Host "Exporting Groups..."

Get-MgGroup -All |
Select-Object DisplayName,
Description,
SecurityEnabled,
MailEnabled |
Export-Csv "$ReportFolder\Groups.csv" -NoTypeInformation

Write-Host "Exporting Managed Devices..."

Get-MgDeviceManagementManagedDevice -All |
Select-Object DeviceName,
OperatingSystem,
OSVersion,
ComplianceState,
ManagementAgent,
UserPrincipalName,
LastSyncDateTime |
Export-Csv "$ReportFolder\ManagedDevices.csv" -NoTypeInformation

Write-Host "Exporting License Information..."

Get-MgUser -All |
Select-Object DisplayName,
UserPrincipalName,
AssignedLicenses |
Export-Csv "$ReportFolder\UserLicenses.csv" -NoTypeInformation

Write-Host ""
Write-Host "Reports exported successfully." -ForegroundColor Green
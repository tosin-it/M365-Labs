# Connect to Microsoft Graph
Connect-MgGraph -Scopes `
"User.Read.All",
"DeviceManagementManagedDevices.Read.All",
"AuditLog.Read.All"

Write-Host "Collecting users..."

$Users = Get-MgUser -All |
Select-Object `
DisplayName,
UserPrincipalName,
AccountEnabled,
CreatedDateTime

$Users |
Export-Csv ".\Reports\UserInventory.csv" -NoTypeInformation

Write-Host "Collecting managed devices..."

$Devices = Get-MgDeviceManagementManagedDevice -All |
Select-Object `
DeviceName,
OperatingSystem,
OSVersion,
ComplianceState,
LastSyncDateTime,
UserPrincipalName

$Devices |
Export-Csv ".\Reports\ManagedDevices.csv" -NoTypeInformation

$Compliant = ($Devices | Where-Object {$_.ComplianceState -eq "compliant"}).Count
$NonCompliant = ($Devices | Where-Object {$_.ComplianceState -ne "compliant"}).Count

[PSCustomObject]@{
    TotalDevices = $Devices.Count
    CompliantDevices = $Compliant
    NonCompliantDevices = $NonCompliant
    ReportGenerated = Get-Date
} |
Export-Csv ".\Reports\ComplianceSummary.csv" -NoTypeInformation

Write-Host ""
Write-Host "Audit completed successfully."


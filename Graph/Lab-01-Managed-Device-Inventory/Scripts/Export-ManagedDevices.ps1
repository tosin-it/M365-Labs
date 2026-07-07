Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

$Devices = Get-MgDeviceManagementManagedDevice -All |
Select-Object `
DeviceName,
OperatingSystem,
OSVersion,
Manufacturer,
Model,
ComplianceState,
ManagementAgent,
UserPrincipalName,
LastSyncDateTime

$OutputPath = ".\ManagedDevices.csv"

$Devices | Export-Csv $OutputPath -NoTypeInformation

Write-Host "Report exported to $OutputPath"
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"

Write-Host "Collecting managed devices..."

$Devices = Get-MgDeviceManagementManagedDevice -All |
Select-Object `
DeviceName,
UserPrincipalName,
OperatingSystem,
OSVersion,
ComplianceState,
ManagementState,
LastSyncDateTime

# Export CSV
$Devices |
Export-Csv ".\Reports\ComplianceReport.csv" -NoTypeInformation

# Build HTML report
$Compliant = ($Devices | Where-Object {$_.ComplianceState -eq "compliant"}).Count
$NonCompliant = ($Devices | Where-Object {$_.ComplianceState -ne "compliant"}).Count

$Summary = @"
<h1>Microsoft Intune Compliance Dashboard</h1>

<h3>Report Generated</h3>
<p>$ReportDate</p>

<h3>Executive Summary</h3>

<ul>
<li>Total Devices: $($Devices.Count)</li>
<li>Compliant Devices: $Compliant</li>
<li>Non-Compliant Devices: $NonCompliant</li>
</ul>
"@

$Devices |
ConvertTo-Html `
-Title "Compliance Dashboard" `
-PreContent $Summary |
Out-File ".\Reports\ComplianceDashboard.html"

Write-Host ""
Write-Host "Dashboard created successfully."
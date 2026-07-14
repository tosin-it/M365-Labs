# Connect to Microsoft Graph
Connect-MgGraph -Scopes `
"Organization.Read.All",
"User.Read.All",
"Group.Read.All",
"Directory.Read.All",
"DeviceManagementManagedDevices.Read.All"

# Connect to Exchange Online
Connect-ExchangeOnline -ShowBanner:$false

Write-Host "Collecting Microsoft 365 data..."

# Organization
$Org = Get-MgOrganization

# Users
$Users = Get-MgUser -All

# Groups
$Groups = Get-MgGroup -All

# Devices
$Devices = Get-MgDeviceManagementManagedDevice -All

# Licenses
$Licenses = Get-MgSubscribedSku

# Shared Mailboxes
$SharedMailboxes = Get-EXOMailbox -RecipientTypeDetails SharedMailbox

# Compliance
$Compliant = ($Devices | Where-Object {$_.ComplianceState -eq "compliant"}).Count
$NonCompliant = ($Devices | Where-Object {$_.ComplianceState -ne "compliant"}).Count

$ReportDate = Get-Date

$Html = @"
<html>

<head>

<title>Microsoft 365 Operations Dashboard</title>

<style>

body{
font-family:Segoe UI;
margin:40px;
}

table{
border-collapse:collapse;
width:70%;
}

th,td{
border:1px solid #ccc;
padding:10px;
}

th{
background:#0078D4;
color:white;
}

</style>

</head>

<body>

<h1>Microsoft 365 Operations Dashboard</h1>

<p><b>Generated:</b> $ReportDate</p>

<table>

<tr><th>Metric</th><th>Value</th></tr>

<tr><td>Tenant</td><td>$($Org.DisplayName)</td></tr>

<tr><td>Total Users</td><td>$($Users.Count)</td></tr>

<tr><td>Total Groups</td><td>$($Groups.Count)</td></tr>

<tr><td>Managed Devices</td><td>$($Devices.Count)</td></tr>

<tr><td>Compliant Devices</td><td>$Compliant</td></tr>

<tr><td>Non-Compliant Devices</td><td>$NonCompliant</td></tr>

<tr><td>Shared Mailboxes</td><td>$($SharedMailboxes.Count)</td></tr>

<tr><td>Subscribed Licenses</td><td>$($Licenses.Count)</td></tr>

</table>

</body>

</html>
"@

$Html | Out-File ".\Reports\M365OperationsDashboard.html"

Write-Host ""
Write-Host "Dashboard created successfully."
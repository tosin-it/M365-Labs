$Org = Get-MgOrganization

$Users = (Get-MgUser -All).Count

$Devices = (Get-MgDeviceManagementManagedDevice -All).Count

$Groups = (Get-MgGroup -All).Count

$Licenses = Get-MgSubscribedSku |
Select-Object SkuPartNumber, ConsumedUnits, PrepaidUnits

$Summary = [PSCustomObject]@{
    TenantName = $Org.DisplayName
    TenantId   = $Org.Id
    TotalUsers = $Users
    TotalDevices = $Devices
    TotalGroups = $Groups
    ReportDate = Get-Date
}

$Summary | Export-Csv ".\Reports\TenantSummary.csv" -NoTypeInformation

$Licenses | Export-Csv ".\Reports\LicenseInventory.csv" -NoTypeInformation

Write-Host "Reports generated successfully."
Connect-MgGraph -Scopes "DeviceManagementManagedDevices.PrivilegedOperations.All"
Write-Host "Retrieving managed devices..."
$Devices = Get-MgDeviceManagementManagedDevice -All |
    Where-Object {$_.ManagementAgent -eq "mdm"}

$Results = foreach ($Device in $Devices) {
    Write-Host "Syncing $($Device.DeviceName)..."
    try {
        Sync-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id
        [PSCustomObject]@{
            DeviceName = $Device.DeviceName
            User       = $Device.UserPrincipalName
            Action     = "Sync"
            Status     = "Success"
            Time       = Get-Date
        }
    }
    catch {
        [PSCustomObject]@{
            DeviceName = $Device.DeviceName
            User       = $Device.UserPrincipalName
            Action     = "Sync"
            Status     = "Failed"
            Time       = Get-Date
        }
    }
}

$Results | Export-Csv "..\Reports\BulkDeviceSyncResults.csv" -NoTypeInformation

Write-Host ""
Write-Host "Bulk device sync completed."


# Restart Device
# Restart-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id

# Remote Lock
# RemoteLock-MgDeviceManagementManagedDevice -ManagedDeviceId $Device.Id

# Rename Device
# Set-MgDeviceManagementManagedDeviceName `
# -ManagedDeviceId $Device.Id `
# -DeviceName "ENG-LT-001"
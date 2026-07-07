$Drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

$FreeSpaceGB = [math]::Round($Drive.FreeSpace / 1GB,2)

if ($FreeSpaceGB -lt 10) {
    Write-Output "Low disk space detected: $FreeSpaceGB GB remaining."
    exit 1
}
else {
    Write-Output "Disk space is healthy: $FreeSpaceGB GB remaining."
    exit 0
}
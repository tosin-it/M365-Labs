# Get-DeviceHealth.ps1
# Collects endpoint health information and writes it to a local report.

$LogFolder = "C:\ProgramData\Company\Logs"
$LogFile = "$LogFolder\DeviceHealthReport.txt"

if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$OS = Get-CimInstance Win32_OperatingSystem
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$AV = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct -ErrorAction SilentlyContinue

$Report = @"
========================================
Device Health Report
Generated: $(Get-Date)

Computer Name : $env:COMPUTERNAME
Logged On User: $env:USERNAME

Operating System:
$($OS.Caption)
Version: $($OS.Version)

Disk Space:
Free (GB): $([math]::Round($Disk.FreeSpace/1GB,2))
Total (GB): $([math]::Round($Disk.Size/1GB,2))

Windows Defender:
$($AV.displayName)

PowerShell Version:
$($PSVersionTable.PSVersion)

========================================
"@

$Report | Out-File $LogFile -Encoding UTF8

Write-Output "Device health report created successfully."
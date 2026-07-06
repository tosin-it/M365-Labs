# Lab 06 - PowerShell Script Deployment

## Objective

Deploy a PowerShell script through Microsoft Intune to collect endpoint health and inventory information from managed Windows devices.

## Environment

- Microsoft 365 E5
- Microsoft Intune
- Microsoft Entra ID
- Windows 11 VM

## Script

**Get-DeviceHealth.ps1**

## Configuration

- Uploaded a PowerShell script to Microsoft Intune
- Configured execution under the SYSTEM account
- Enabled 64-bit PowerShell execution
- Assigned the script to a Windows 11 test device group

## Validation

The script executed successfully and generated a device health report containing:

- Computer name
- Logged-on user
- Windows version
- Available disk space
- Windows Defender status
- PowerShell version
- Report generation timestamp

## Skills Demonstrated

- PowerShell automation
- Microsoft Intune
- Endpoint inventory collection
- Remote administration
- Logging and reporting

## Screenshots

See the **Screenshots** folder for deployment and validation evidence.
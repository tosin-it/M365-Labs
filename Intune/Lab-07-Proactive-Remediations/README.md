# Lab 07 - Proactive Remediations

## Objective

Deploy a Proactive Remediation package using Microsoft Intune to detect low disk space and automatically remove temporary files.

## Environment

- Microsoft 365 E5
- Microsoft Intune
- Microsoft Entra ID
- Windows 11 VM

## Detection Script

Checks available disk space on the system drive and reports non-compliance when free space falls below 10 GB.

## Remediation Script

Removes temporary files from the Windows temporary directory to reclaim disk space.

## Configuration

- Uploaded detection and remediation scripts
- Configured execution under the SYSTEM account
- Scheduled daily execution
- Assigned to a Windows 11 test device group

## Validation

- Detection script evaluated device health
- Remediation executed when applicable
- Status successfully reported to Microsoft Intune

## Skills Demonstrated

- Proactive Remediations
- PowerShell automation
- Endpoint health monitoring
- Automated maintenance
- Microsoft Intune administration

## Screenshots

See the **Screenshots** folder for deployment and validation.
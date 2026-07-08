# Lab 04 - License Assignment Automation

## Objective

Automate Microsoft 365 license assignment to Microsoft Entra ID users using Microsoft Graph PowerShell.

## Environment

- Microsoft 365 E5
- Microsoft Graph PowerShell SDK
- Microsoft Entra ID
- Windows 11

## Data Source

- Imported users from `Users.csv`

## Configuration

- Connected to Microsoft Graph
- Retrieved available Microsoft 365 license SKU
- Assigned licenses to users from a CSV file
- Checked for existing license assignments before applying new licenses
- Included execution summary and error handling

## Validation

Verified that:

- Microsoft 365 licenses were successfully assigned
- Previously licensed users were skipped
- License assignments appeared in Microsoft Entra ID

## Skills Demonstrated

- Microsoft Graph PowerShell
- License automation
- Microsoft Entra ID administration
- Bulk user management
- PowerShell error handling

## Screenshots

See the **Screenshots** folder for license assignment and validation.
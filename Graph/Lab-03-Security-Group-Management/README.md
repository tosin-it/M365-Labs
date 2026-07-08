# Lab 03 - Security Group Management

## Objective

Automate the creation of Microsoft Entra security groups and assign users to department-based groups using Microsoft Graph PowerShell.

## Environment

- Microsoft 365 E5
- Microsoft Graph PowerShell SDK
- Microsoft Entra ID
- Windows 11

## Data Source

- Imported group information from `Groups.csv`
- Imported user information from `Users.csv` created in Graph Lab 02

## Configuration

- Connected to Microsoft Graph
- Created department-based security groups
- Used CSV data as the source of truth for user assignments
- Checked for existing groups before creation
- Checked for existing group membership before adding users
- Automatically assigned users to the appropriate department group
- Included error handling for duplicate objects and missing mappings

## Validation

Verified that:

- Security groups were successfully created
- Users were added to the correct department groups
- Duplicate group creation was skipped
- Duplicate memberships were prevented

## Skills Demonstrated

- Microsoft Graph PowerShell
- Microsoft Entra ID administration
- Security group automation
- Group membership management
- CSV-driven automation
- PowerShell error handling

## Screenshots

See the **Screenshots** folder for group creation and membership validation.
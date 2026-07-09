# Lab 02 - Dynamic Security Groups

## Objective

Create a Dynamic Security Group in Microsoft Entra ID that automatically manages membership based on the Department attribute.

## Environment

- Microsoft 365 E5
- Microsoft Entra ID

## Configuration

- Updated user Department attributes
- Created a Dynamic Security Group
- Configured a dynamic membership rule
- Automatically assigned users based on Department

## Membership Rule

```text
user.department -eq "IT"
```

## Validation

Verified that users matching the Department attribute were automatically added to the group.

## Skills Demonstrated

- Microsoft Entra ID
- Dynamic Groups
- Identity Automation
- Attribute-based Access Control (ABAC)
- Zero-Touch User Lifecycle Management

## Screenshots

See the **Screenshots** folder.
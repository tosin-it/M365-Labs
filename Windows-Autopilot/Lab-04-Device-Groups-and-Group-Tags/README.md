# Lab 04 - Device Groups & Group Tags

## Objective

Automate Windows Autopilot deployment profile assignment using Group Tags and Dynamic Device Groups.

## Environment

- Microsoft 365 E5
- Microsoft Intune
- Microsoft Entra ID
- Windows 11 VM

## Configuration

- Assigned a Group Tag to an Autopilot device
- Created a Dynamic Device Group
- Configured a dynamic membership rule using the Group Tag
- Assigned an Autopilot Deployment Profile to the Dynamic Device Group

## Dynamic Membership Rule

```text
(device.devicePhysicalIds -any (_ -eq "[OrderID]:IT-Devices"))
```

## Validation

Verified that the Autopilot device automatically became a member of the Dynamic Device Group and received the assigned deployment profile.

## Skills Demonstrated

- Windows Autopilot
- Dynamic Device Groups
- Group Tags
- Microsoft Intune
- Microsoft Entra ID
- Automated Endpoint Provisioning

## Screenshots

See the **Screenshots** folder.

## Workflow

Device Imported ---->> Group Tag Assigned ---->> Dynamic Device Group ---->> Deployment Profile Assigned ---->> Device Provisioned
      
     
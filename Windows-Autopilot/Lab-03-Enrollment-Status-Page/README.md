# Lab 03 - Enrollment Status Page (ESP)

## Objective

Configure the Windows Autopilot Enrollment Status Page (ESP) to ensure required applications and policies are installed before users access the Windows desktop.

## Environment

- Microsoft 365 E5
- Microsoft Intune
- Windows 11 VM

## Configuration

- Created an Enrollment Status Page profile
- Displayed application and policy installation progress
- Blocked desktop access until required configurations completed
- Assigned the ESP profile to Autopilot devices

## Provisioning Workflow

1. Device powers on
2. Windows Autopilot identifies the device
3. User signs in
4. Enrollment Status Page appears
5. Device enrolls into Microsoft Intune
6. Required applications install
7. Security and compliance policies apply
8. Desktop becomes available

## Validation

Verified ESP configuration, assignment, and deployment settings in Microsoft Intune.

## Skills Demonstrated

- Windows Autopilot
- Enrollment Status Page
- Microsoft Intune
- Endpoint Provisioning
- Device Deployment

## Screenshots

See the **Screenshots** folder.


## ESP Workflow


User powers on device
        │
        ▼
Autopilot identifies device
        │
        ▼
User signs in
        │
        ▼
Enrollment Status Page appears
        │
        ▼
Device joins Entra ID
        │
        ▼
Intune enrollment begins
        │
        ▼
Required apps install
        │
        ▼
Security policies apply
        │
        ▼
Compliance policies evaluate
        │
        ▼
Desktop becomes available
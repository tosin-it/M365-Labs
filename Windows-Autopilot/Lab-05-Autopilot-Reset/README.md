# Lab 05 - Autopilot Reset & Redeployment

## Objective

Demonstrate the Windows Autopilot Reset process used to prepare an existing device for a new user while preserving Autopilot registration and Microsoft Intune management.

## Environment

- Microsoft 365 E5
- Microsoft Intune
- Windows Autopilot
- Windows 11 VM

## Configuration

- Reviewed available remote device actions
- Documented the Autopilot Reset workflow
- Validated device registration and deployment profile assignment
- Demonstrated enterprise device redeployment procedures

## Validation

Verified that the device remained registered with Windows Autopilot and retained its deployment profile after the reset process (or validated the configuration in a lab environment).

## Skills Demonstrated

- Windows Autopilot
- Device Lifecycle Management
- Endpoint Recovery
- Microsoft Intune
- Enterprise Device Provisioning

## Screenshots

See the **Screenshots** folder.

## Workflow

Administrator initiates Autopilot Reset -> Device restarts -> User profile and local data removed -> Device remains registered in Autopilot -> Device remains enrolled in Intune -> Autopilot OOBE starts -> User signs in -> Policies and applications reinstall
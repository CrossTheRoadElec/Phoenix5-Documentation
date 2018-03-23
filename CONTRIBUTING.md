# Contributing to CTR-Electronics

Table of Contents
- [Reporting Bugs](#reporting-bugs)
- [Requesting a feature](#requesting-a-feature)
- [Pull Requests](#pull-requests)

## Reporting Bugs
Submitting bugs relevant to the API will typically be done in the [Phoenix-FRC-Lib](https://github.com/CrossTheRoadElec/Phoenix-frc-lib) repository. Use a descriptive title. Use the following format:
```
Expected behavior, link to documentation referencing expected behavior beneficial.
Observed behavior. Screenshots of self test strongly recommended.
Procedure to reproduce observed behavior.
Versions of all relevant devices (Phoenix Version, Firmware Version, RoboRIO Image Version, WPILib Plugin Version, Language).
```
Good example:
```
Title: Motor output incorrect when Current Limit is Enabled
Expected behavior: Motor output follows driven percent output or less when current limit is enabled (Section 9.3 of Talon SRX Software Reference Manual)
Observed behavior: Motor output "sticks" to previous value or oscillates between driven percent output and off when current limit is enabled
Procedure: Factory-Reset Talon SRX -> Configure Peak Limit to 5 amps -> Configure Continous Current to 5 amps -> Drive CIM Motor to full speed -> Observed Behavior
Versions: Phoenix 5.3.1.0, Talon SRX Firmware 3.8, RoboRIO Image v17, WPILib Update 2018.4.1, Java
```
## Requesting a Feature
Submitting a feature request is similar, however it should be done in the [Documentation](https://github.com/CrossTheRoadElec/Phoenix-Documentation) repository. Format is as follows:
```
Feature Request in as much detail as possible.
Why it is beneficial.
A series of steps to test the feature after it is implemented
```
Good example:
```
Title: Update HERO NetMF to Phoenix API
Request: HERO netMF should be updated to the latest Phoenix API
Why: HERO is currently unable to utilize the many new features and new products available to FIRST teams, it should be updated to use the other CAN devices that CTR sells.
Test Plan: Port Java Examples to C#, use them to test all new features.
```
## Pull Requests
Pull requests have the following guidlines:
- Descriptive title, no issue number in title
- Follows the style sheet consistent with the rest of the code in the repository
- Follows the below template
```
Description of change
Why this should be added
Test Procedure
Test Results
Related Pull Requests/Issues
```
Good Example:
```
Title: Contributing.md Addition
Why this should be added: A Contributing file will streamline the process of creating pull requests and allow more users to contribute to the organization.
Test Procedure: Documentation Change, no Test Procedure
Test Results: Change took effect
Issues: No issues this fixes
```
Other good example:
```
Title: Phoenix NetMF Port
Why this should be added: HERO uses NetMF to function and currently has no port of Phoenix. This resolves that issue
Test Procedure: Run through all examples in the Phoenix Example Languages ported to C#
Test Results: Examples work in same fashion as they did in FRC
Issues: Fixes #33 "Update HERO NetMF to Phoenix API"
```

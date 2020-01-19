.. _ch22_SoftReleaseNote:

Software Release Notes
======================

Talon FX / Talon SRX / Victor SPX
--------------------------------------------------------
The kickoff firmware is 20.0.0.0.
The latest firmware is 20.1.0.0.

This version is adequate for FRC and nonFRC use (notwithstanding known 
:ref:`errata with HERO C#<Errata-hero>`).

Talon SRX/Victor SPX Firmware (20.1): Added CANCoder as a remote sensor source.
Talon FX Firmware (20.1.0.0): Fixes Remote Sensors, adds CANCoder as a remote sensor source.
Talon FX Firmware (20.1.0.0): Fixed issue where followers were slightly different than master.
  
CANCoder
--------------------------------------------------------
The kickoff firmware is 20.0.0.1.
The latest firmware is 20.1.0.0.

CANCoder (20.1.0.0): Added fault/sticky-fault for when the magnet strength is too weak.

CANifier
--------------------------------------------------------
The kickoff/latest firmware is 20.0.

Pigeon IMU
--------------------------------------------------------
The kickoff/latest firmware is 20.0.


PCM
--------------------------------------------------------
PCMs ship with firmware 1.62.
Latest firmware is 1.65.
Either firmware is functional for FRC use.

PDP
--------------------------------------------------------
PDPs ship with firmware 1.30.
Latest firmware is 1.40 (auto zeros channels on boot).
Either firmware is functional for FRC use, however 1.40 is recommended as it has the total power/current signals used by LiveWindow in WPILib.


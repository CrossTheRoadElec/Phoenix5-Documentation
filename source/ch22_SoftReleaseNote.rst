.. _ch22_SoftReleaseNote:

Software Release Notes
======================

This section covers the basic firmware versions that are in use.

For a complete and comprehensive list, see the full `Release Notes`_.

.. _Release Notes: https://www.ctr-electronics.com/downloads/release_notes/RELEASE_NOTES


Talon FX (Falcon 500) / Talon SRX / Victor SPX
--------------------------------------------------------
The kickoff firmware is 20.0.0.0, and the latest firmware is 20.2.3.0.

These versions are adequate for FRC and nonFRC use (notwithstanding known :ref:`errata with HERO C#<Errata-hero>`).

The 20.2 firmware update
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Talon FX 20.2.3.0 supports Sensor Coefficient in this update.

Talon FX 20.2.3.0 also supports Music.

Talon SRX 20.2 improved the quadrature velocity measurement under certain conditions, so that it was less noisy.

Victor SPX latest firmware is still 20.1

The 20.1 firmware update
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Remote CANCoder support was added in 20.1 for all motor controllers.
Talon FX 20.1.0.0 also fixed an issue where Talon FX follower is negligibly different than master.

CANCoder
--------------------------------------------------------
The kickoff firmware is 20.0.0.1, and the latest firmware is 20.1.0.0.

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


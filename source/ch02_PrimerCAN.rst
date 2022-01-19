Primer: CTRE CAN Devices
========================

CTR-Electronics has designed many of the available CAN bus devices for FRC-style robotics.
This includes:

- Motor Controllers such as Talon FX, Talon SRX, and Victor SPX
- Orientation devices such as Pigeon IMU and Pigeon 2.0
- Sensors such as CANcoder and CANifier
- Full list of :ref:`Phoenix devices <Do I need to install any of this?>`
- Pneumatics Control Mode (PCM)
- Power Distribution Panel (PDP)

These devices have similar functional requirements, specifically every device of a given model group requires a unique device ID for typical FRC use (settings, control and status).  The device ID is usually expressed as a number between ‘0’ and ‘62’, allowing use for up to 63 Talon SRXs, 63 Victors, 63 PDPs, etc. at once.  This range does not intercept with device IDs of other CAN device types.  For example, there is no harm in having a Pneumatics Control Module (PCM) and a Talon SRX both with device ID ‘0’.  However, having two Talon SRXs with device ID ‘0’ will be problematic.

These devices are field upgradable, and the firmware shipped with your devices will predate the “latest and greatest” tested firmware intended for use with the latest API release.  Firmware update can be done easily using Phoenix Tuner.

The Talon FX/SRX and Victor SPX provide two pairs of twisted CANH (yellow) and CANL (green) allowing for daisy chaining.  Other devices such as the PDP and PCM have Weidmuller connectors that accept twisted pair cabling.  Often you will be able to use your Talons and Victors to connect together your PCM and PDP to each other. 

The CAN termination resistors are built into the FRC robot controller (roboRIO) and in the Power Distribution Panel (PDP) assuming the PDP’s termination jumper is in the ON position.

.. warning: Talon FX and Talon SRX share the same model group.  This means you must use unique device IDs between your Talon FXs and Talon SRXs.

More information on wiring and hardware requirements can be found in the user manual of each device type.

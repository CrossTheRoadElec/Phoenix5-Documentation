.. _Errata:

Errata
======
.. _Errata-hero:

HERO firmware compatibility with firmware 4.X
--------------------------------------------------------
The HERO robot controller still requires 11.X firmware in the motor controllers to function correctly.
This will addressed in a future release (which updates HERO).

Phoenix Tuner is odd at higher display resolution/DPI
--------------------------------------------------------
Opening Tuner on a monitor that has a *high* dpi setting (where Windows recommends 250%) can cause the form to not render correctly.
We recommend using a monitor resolution near 1920 X 1080 until issue is resolved.

.. tip:: Phoenix-Tuner 1.2.0 has improvements for this.  Phoenix-Tuner 1.3.0 has the issue fixed.

Version reported by getPhoenixVersion() is incorrect
--------------------------------------------------------
Phoenix version 5.14.X incorrectly report the version as 5.13.X when returned by the getPhoenixVersion() API call.

Phoenix Tuner specifying team number may work inconsistently
----------------------------------------------------------------------
Tuner will connect via hostname/IP or via team number.  
When specifying team number, the roborio-TEAM-FRC.local host name is used correctly, however mDNS does not appear to reliably resolve.

Using static-IP or using USB works as expected.

.. tip:: Phoenix-Tuner 1.2.0 has improvements for this.

A tentative fix has been tested where Tuner will manually resolve it, working around this limitation.
This improvement will be incorporated in a future update.

Pigeon IMU may not work as Remote Sensor
-----------------------------------------
Pigeon IMU CRF 4.0 has a reported issue where if Pigeon is connected via ribbon cable, the Talon/Victor will not detect it when performing remote sensor features.

.. tip:: `Pigeon Firmware <https://github.com/CrossTheRoadElec/Phoenix-Releases/releases/tag/Pigeon_IMU_v4.13>`_ 4.13 has a fix for this.


No S-Curve VI in LabVIEW
-----------------------------------------
Pass '412' as the parameter, and the desired S-Curve strength [0,8] as the value.

A value of 0 represents no S-Curving (trapezoidal profiling).

To set the S-Curve strength in LabVIEW, the following LV snippet can be used.

.. tip:: Drag and drop the bottom image into your LabVIEW Block Diagram.

.. image:: img/lv-scurve.png

Talon SRX/Victor SPX D-Error not applied correctly in Motion Magic/Motion Profile closed-loop modes
-----------------------------------------------------------------------------------------------------
Motor Controller firmware incorrectly applies the D-gain in Motion Magic/Motion Profiling mode - the D-term is targeting zero velocity instead of the current target velocity.

.. tip:: Talon SRX/Victor SPX CRF 4.22 and later contain a fix to properly apply the D-term as intended.  This fix can be enabled by setting configuration parameter 122 to a value of '1'.
    This fix is not enabled by default to prevent an unexpected change in closed-loop behavior when updating firmware mid-season.
    
    Example: To enable this fix in Java, use the following function call: 
    `_talon.configSetParameter(122, 1, 0, 0, timeoutMs);`
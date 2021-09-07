.. _Errata:

Errata
======

.. _talonfx-remoteID-errata:

Talon FX Remote Filter Device ID Must be 15 or Less
---------------------------------------------------------------- 
When configuring Talon FX to have a remote sensor, the filter's device ID must be 15 or less.

Attempting to set a Remote Filter Device ID >15 in Phoenix Tuner will result in a "DI_Mismatch" error.

When running a robot program, the filter device ID will not be the expected value and so will generate an error that the remote sensor is missing on the bus.  
The associated fault will also be asserted and can be viewed in self-test snapshot of the Talon FX.

The actual filter device ID set will be truncated to the original set value modulo 15.

.. tip:: This is fixed in firmware version 21.0.1.0


Java Simulation: WPI_TalonSRX/WPI_VictorSPX Null Pointer Exception
-------------------------------------------------------------------------------------
When running simulation, the following error can occur:

::

    Error at com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX$OnPeriodicCallback.run(WPI_TalonSRX.java:208): Unhandled exception: java.lang.NullPointerException
            at com.ctre.phoenix.motorcontrol.can.WPI_TalonSRX$OnPeriodicCallback.run(WPI_TalonSRX.java:208)
            at edu.wpi.first.hal.HAL.simPeriodicBefore(HAL.java:41)
            at edu.wpi.first.wpilibj.IterativeRobotBase.loopFunc(IterativeRobotBase.java:281)
            at edu.wpi.first.wpilibj.TimedRobot.startCompetition(TimedRobot.java:117)
            at edu.wpi.first.wpilibj.RobotBase.runRobot(RobotBase.java:335)
            at edu.wpi.first.wpilibj.RobotBase.lambda$startRobot$0(RobotBase.java:387)
            at java.base/java.lang.Thread.run(Thread.java:834)

This occurs when multiple WPI_TalonSRX objects have been created with the same device ID or multiple WPI_VictorSPX objects have been created with the same device ID. 
Find and remove the extra objects from your java code.

.. _Errata-hero:

HERO firmware compatibility with firmware 4.X
--------------------------------------------------------
The HERO robot controller still requires v11.X firmware in the motor controllers to function correctly.
This will addressed in a future release (which updates HERO).

THe HERO robot controller also still requires v0.41 firmware for Pigeon IMU.
This will addressed in a future release (which updates HERO).

No S-Curve VI in LabVIEW
-----------------------------------------
Pass '412' as the parameter, and the desired S-Curve strength [0,8] as the value.

A value of 0 represents no S-Curving (trapezoidal profiling).

To set the S-Curve strength in LabVIEW, the following LV snippet can be used.

.. tip:: Drag and drop the bottom image into your LabVIEW Block Diagram.

.. image:: img/lv-scurve.png

Stator Current Limit Threshold Configs
-----------------------------------------
The trigger threshold current and time are not honored in 20.0.0 firmware.
Stator current limit will trigger when the measured current exceeds the limit (within 1ms).


CANCoder not a remote sensor source
-----------------------------------------
CANCoder is not available as a remote sensor source for Talon FX/SRX and Victor SPX.  This will be addressed in a future update.

.. tip:: This was added in Phoenix v5.17.6.  Motor Controller must be updated to 20.1 or newer.


Remote Sensors Not Working with Talon FX
-----------------------------------------
The remote sensor feature does not work with Talon FX.

.. tip:: This is fixed in firmware version 20.1


Kickoff Temporary Diagnostic Server may not work
----------------------------------------------------
The kickoff version of Tuner and temporary diagnostic server has a known issue where CAN bus devices may not show up. **This has been fixed in version 1.6.0.0 of Tuner.** This can be quickly checked by looking at the robot controller install tab of Tuner. If there is no purple "Restart LabVIEW Robot Code" button, Tuner is not up to date and may have this issue. Your version of Tuner should look like the following:

.. image:: img/tuner-proper.png

LabVIEW 2020 Deploys failing
-----------------------------------------
During our system level validation, we observed a circumstance where LabVIEW permanent deploys would fail ("Connection disconnected by peer").
We are currently investigating this, but we will tentatively report the following suggestions until we complete our assessment.

- When deploying LabVIEW, we recommend disconnecting Phoenix Tuner to ensure it doesn't influence LabVIEW's deploy process.
- If deploys are consistently failing, the running LabVIEW application can be cleared via SSH with ``/usr/local/frc/bin/frcKillRobot.sh -t -r`` or press the UnDeploy LabVIEW/Diag Server button in Tuner - Robot Controller Install.  This should bring the roboRIO into an empty state whereby deploy can be re-attempted.
- Alternatively roboRIO could also be reset using DriverStation "Reboot roboRIO" button.  This is effective if roboRIO is running a temporary deployed LV application or temporary diagnostic server.

.. tip:: This has been resolved in Phoenix v5.17.4.

LabVIEW 2020 Shared-Object Deployment Limitations
--------------------------------------------------
When a user hard-deploys an application **while a soft-deployed-session is running**, LabVIEW will sometimes cause deployed shared objects to become inoperable.
If this occurs in a project with Phoenix, the project will fail on the deploy step, citing *the network connection was closed by the peer*, and the robot application will be unable to use Phoenix.

To work around this, **press finish on the front panel of Robot Main** before you hard deploy your application.

TalonFX Current Reporting Status Frame Not Available
----------------------------------------------------
The Status Frame that TalonFX uses when reporting its supply and stator current is not available under the StatusFrame or StatusFrameEnhanced enum.
The enum will be modified to include this frame in a future update. 
Currently, the following can be done to modify the Current Measurement Status Frame period:

.. code-block:: java

    _fx.setStatusFramePeriod(0x1240, periodMs); //0x1240 is used to identify the Current Status Frame

.. tip:: This has been resolved in Phoenix v5.17.6.

Talon FX Thermal Limits Low when using PWM Out-of-the-Box
----------------------------------------------------------------
Talon FX's ship firmware has lower thermal limits that current firmware.
If using the Talon FX with PWM control, users may still want to update firmware over CAN to take advantage of the higher thermal limits.

Talon FX does not support Sensor Coefficient
---------------------------------------------
Configuring a sensor coefficient on Talon FX does not do anything.

.. tip:: This has been resolved in firmware version 20.2.3.0

Talon FX Continuous-Deadbands all the time
-------------------------------------------------
Talon FX will always follow a continuous deadband regardless of the mode it's in. This results in double-deadbanding for a follower, which is seen by the applied output of the follower being slightly different than the master. Read more about Continuous Deadbanding inside :ref:`ch13_MC`.

.. tip:: This has been resolved in firmware version 20.1.0.0

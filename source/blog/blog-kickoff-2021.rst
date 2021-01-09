.. post:: Jan 8, 2021

BLOG: FRC 2021 Kickoff
======================

Hello FRC Community!

We've just released our 2021 kickoff release of Phoenix Framework (**5.19.4.1**).
The Phoenix Windows installer and zips for macOS and Linux are `now available <https://github.com/CrossTheRoadElec/Phoenix-Releases/releases>`_.

You can find the latest firmware CRFs at each product page (the installer also installs them).

The new features included in this season's release are listed below.

Simulation Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We've spent our offseason investing in a **new suite of simulation features** designed to allow effective development without requiring access to hardware.

This includes:

- Simulation of **device-level** features, such as Motion Magic
- **Full feature support** of Phoenix Tuner (including Plotter, Self Test Snapshot, Control, and Configs)
- Support for simulated **device-to-device** features, such as follower mode and remote sensors/limit-switches
- Integration with **WPILib's simulation GUI** when using WPI\_\* classes
- **Supported Devices:** Talon SRX, Victor SPX (future releases will include more devices)
- **Supported Operating Systems:** Windows, Linux, macOS
- **Supported Languages:** Java, C++

If you encounter any limitations with Talon SRX or Victor SPX simulation, please contact support@ctr-electronics.com or file an issue tracker `here <https://github.com/CrossTheRoadElec/Phoenix-Releases/issues>`_.

Phoenix Simulation Examples
+++++++++++++++++++++++++++++++++++

For teams that want to start leveraging simulation features right now, the basic steps are:

1. Check out one of our `examples <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages>`_ that supports simulation (such as the `Motion Magic example <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/blob/a38b8d193a91eb9deae270daf49bde5730309322/Java%20General/MotionMagic/src/main/java/frc/robot/Robot.java#L93>`_).
2. Open the example in **Visual Studio Code** and `run in simulation <https://docs.wpilib.org/en/stable/docs/software/wpilib-tools/robot-simulation/introduction.html>`_.
3. Open **Phoenix Tuner** and set the **Diagnostic Server Address** to ``localhost``. Simulated devices will appear in Phoenix Tuner in a few seconds.
4. Develop as normal.

.. tip:: We invite teams to leverage their preferred physics simulators by utilizing the `SimCollection <https://www.ctr-electronics.com/downloads/api/java/html/classcom_1_1ctre_1_1phoenix_1_1motorcontrol_1_1_talon_s_r_x_sim_collection.html>`_ functions in Talon SRX and Victor SPX as seen `here <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/blob/a38b8d193a91eb9deae270daf49bde5730309322/Java%20General/MotionMagic/src/main/java/frc/robot/sim/TalonSRXSimProfile.java#L48>`_.

.. note:: Simulating non-FRC applications (not using WPI\_\* classes) will require calling ``Unmanaged.feedEnable(100);`` to enable simulated actuators.

Additional documentation for simulation will be available in the future.

Online API Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~
The online API documentation has been updated for 2021.

C++ documentation can be found `here <https://www.ctr-electronics.com/downloads/api/cpp/html/index.html>`_.

Java documentation can be found `here <https://www.ctr-electronics.com/downloads/api/java/html/index.html>`_.

**Java teams** should note that the **documentation jar** is installed locally after running our installer.

LabVIEW
~~~~~~~~~~~~~~~~~~~~~~~~~~~
No new functionality has been added to Phoenix for LabVIEW users this season.

Release Testing Observations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
During our release testing process, we observed the following limitations:

roboRIO 2021 v3.1 Image
++++++++++++++++++++++++++++
We observed that we **could not reliably image** our roboRIOs with the **2021 v3.1 image**. As a result, all of our testing has been done using the 2021 **v3.0** image.

LabVIEW Deploy Limitation
++++++++++++++++++++++++++++
We have noticed an intermittent issue that **corrupts the Phoenix library files during LabVIEW deploy**. This is reproduced by the following procedure:

1. Soft deploy your application (clicking the white arrow in Main.vi or <Ctrl>+R)
2. Hard deploy your application (right-click "FRC Robot Boot-up Deployment", Run As Startup)

This dialog pops up when the issue occurs:

.. image :: ../img/labview-deploy-limitation.png

**To solve this issue, hard deploy your application again.**

Back-breaking API changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~
In anticipation of future releases that support custom unit scaling, several of the Java and C++ routines have been updated to use doubles instead of ints.

We have also removed routines that have been deprecated for multiple seasons.

Removed motor controller routines:

- set(ControlMode, double, double)
- enableHeadingHold(bool)
- selectDemandType(bool)
- getActiveTrajectoryHeading()

Removed PigeonIMU routine:

- configTemperatureCompensationEnable(bool, int)

Firmware
~~~~~~~~~~~~~~~~~~
There are some new firmware files for this season. However, they are **not required** for general functionality.

A maintenance release (v21.0) for Falcon 500 (Talon FX), Talon SRX, and Victor SPX is available at each product page (the installer also installs them).


Good luck, and stay safe!
- The CTRE Engineering Team

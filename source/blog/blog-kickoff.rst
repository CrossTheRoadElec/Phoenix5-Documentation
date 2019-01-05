.. post:: Jan 4, 2019

BLOG: FRC 2019 Kickoff
======================

Once again it is time to kick off a new FRC season!

The Phoenix installer and non-Windows binary kit is now available.

You can also find the latest firmware CRFs at each product page (the installer also installs them).

The new features included in this season's release are listed below.  
What's great about this list is that every single feature was a request from an FRC student or mentor.
Also this year's API release is **almost entirely backwards compatible**.


New features below
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* SetInverted also takes an enum for simpler follower.  SetInverted(bool) still exists and works exactly the same as last season.
* Motion Profile and Motion Profile Arc have an explicit feedforward term (allows for kS, kV, kA, etc..) for both primary and aux PIDs.
* Motion Profile (and Arc) use a linear interpolator to adjust the targets every 1ms.  This means you can send less points, reducing CAN bandwidth, but still have resolute control.
* Motion Profile API has a simpler mode where you can simply call Start/IsFinished.  Legacy API still exists and is supported.
* Phoenix Tuner and Phoenix Diagnostics Server replaces the silverlight based diagnostics from past seasons.
* Phoenix Tuner provides the means of driving Talons for simple testing.
* Phoenix Tuner includes a plotter.
* Phoenix Tuner provides import and export of all configs.
* New config routines to simplify management of persistent settings: configFactoryDefault and `configAllSettings <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/tree/master/Java/Config%20All>`_
* Compatibility with WPI distributed Visual Studio Code interface.
* Maven hosted API provides an alternative to using the Phoenix installer to get API binaries (however the offline install is highly recommended).
* No more FRC versus nonFRC firmware, see "FRC Lock" features for explanation.
* Phoenix C++ API is portable to RaspPI, Linux-Desktop, NVIDIA Jetson TX2, etc.
* Performance improvements of all CAN get routines (get routines take far less time to execute than previous seasons).
* Talon SRX: Maximum reportable velocity increased.  New maximum RPM is 38400 RPM (@ 4096 untis per rotation).

.. note:: Installing Phoenix on another Linux device and controlling Talon SRX / Victor SPXs may or may not be FRC legal depending on 2019 rules.

Fixes
~~~~~~~~~~~~~~~~~~~~~~
* Current Limit Errata fixed from last year on Talon SRX.
* SetYaw fixed from last year to be in degrees on Pigeon IMU.

Back-breaking API changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~
* If using Motion Profile Arc, be sure to set the bAuxPID flag to true in the trajectory points.  This member variable did not exist before.
* Motion Profile Trajectory point duration is now integer (milliseconds) with [0,127] ms range.
* MotionMagicArc enum removed from LabVIEW.  This enum was never used.  Arc'ing with Motion Magic is accomplished with the four-parameter set() and MotionMagic enum.

Good luck this build season!
- Omar Zrien

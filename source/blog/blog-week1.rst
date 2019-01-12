.. post:: Jan 11, 2019

BLOG: FRC 2019 Week 1
=====================

Hello FRC Community,

It's the end of "week 1" of the build season, and a good time for an update from CTRE.

C++/Java teams appear to generally be successful becoming familiar with this year's new software collection (VS Code + Phoenix + Tuner).
If your team has not updated yet, we recommend starting with `WPI Screensteps <https://wpilib.screenstepslive.com/s/4485/>`_, then running through `Phoenix Framework Documentation <https://phoenix-documentation.readthedocs.io/en/latest/ch03_PrimerPhoenixSoft.html>`_ for CTRE devices.

LabVIEW teams appear to be up and running as well with our kickoff software library.
We've encountered a single report of an `install related issue <https://github.com/CrossTheRoadElec/Phoenix-Releases/issues/1>`_, which has been reproduced and fixed.
As a reminder to teams, please **use Tuner to install the Phoenix library** into your roboRIO, and not last year's HERO LifeBoat.

See the sections below for more information and good luck this build season!

Omar Zrien

Co-owner CTR-Electronics

Updated API Docs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This week we went through our C++/Java API **filling in any missing comment block sections**.
The online API doc has been updated for `C++ <http://www.ctr-electronics.com/downloads/api/cpp/html/index.html>`_ and `Java <http://www.ctr-electronics.com/downloads/api/java/html/index.html>`_.
Of course if you still have questions, feel free to contact our support directly.

Remember to update the firmware!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We got a few calls this week from teams reporting that their Talon SRX motor controllers would not enable as expected.
In almost every circumstance **the root-cause was not updating to this year's firmware (4.11)**.
Once updated, they were ready to rock and roll.

So as a reminder, teams should ensure that their motor controllers are up to date for proper functionality with 2019 software.

Phoenix on other platforms?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Some teams are already aware that *Phoenix isn't just a library targeted for the roboRIO*.
For those of you perusing our `maven site <http://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix>`_ you may have noticed *several Linux binaries*.
These have been used for leveraging Talons/Victors/CANifiers/Pigeon on third party hardware such as:

- Raspberry PI + SocketCAN interface
- NVIDIA Jetson TX2 + native CAN
- Even Linux Desktop with SocketCAN device plugged in.

After reviewing the FRC rules, it appears that leveraging these CAN devices from third-party CAN hardware is now officially FRC legal.
This opens up an entirely new way to develop robots in FRC.

 - Want to update your set-points from your Raspberry PI vision system?
 - Want to run closed-loops in your NVIDIA Jetson?
 - Do you prefer a development platform/environment outside of the roboRIO control system?

For the first time ever, you can now update your control outputs *outside of the roboRIO*, while the *roboRIO safely manages the enable/disable* of your Talon SRXs and Victor SPXs.

The requirements for this are to link the appropriate Phoenix-targeted library into your application (typically Linux-amd64, Linux-armhf, Linux-aarch64), allowing you to use the same Phoenix API on your platform.

Additionally you must provide a CAN bus interface.  A popular method to do this is with through SocketCAN.

And finally make sure Phoenix loads on the roboRIO, either by creating a dummy Phoenix CAN device that is not on the bus, or calling the new loadPhoenix() routine.

We have a `GitHub example <https://github.com/CrossTheRoadElec/Phoenix-Linux-SocketCAN-Example>`_ demonstrating this type of control on an FRC robot with a Raspberry PI + CANable(USB).
Driver station is used to enable/disable the robot, and the rest is done in the Raspberry PI C++ application.

.. note:: Reading gamepads inputs on a raspberry pi is typically not FRC legal, but controlling the Talons from the pi now is.

.. note:: This applies to CAN-bus control of Talon SRX/Victor SPX, and **not PWM**.

Phoenix Tuner 1.0.2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We released a minor update to Tuner today.
Tuner 1.0.2 is packaged with today's installer (see below) but also available as a separate download...

https://github.com/CrossTheRoadElec/Phoenix-Releases/releases

Fixes:

- Improved the form response to high-dpi monitors.  Note that the plotter features still work best at 1920 X 1080 (otherwise Windows may auto-scale the application on plotter-enable).
- Improved mDNS resolving.  This improves discovery of the roboRIO when user enters team number instead of a static-IP or 172.22.11.2 (USB) host name.

Phoenix Framework 5.12.1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We also released a minor Phoenix update today.  

https://github.com/CrossTheRoadElec/Phoenix-Releases/releases

The same API comment-block updates that were applied on our site are now in our library so that VS Code Intellisense can display more information.

.. tip:: C++ teams may have to invoke "./gradlew clean" and/or "WPILib C++: Refresh C++ Intellisense" for Intellisense to update.

Our maven site has also been updated with the 5.12.1 libraries.

We also added more firmware version checking (we report a DriverStation message already, but we now do it as soon as the Phoenix object is created, instead of waiting for you to call certain routines).
We were motivated to do this due to the support calls we got this week mentioned earlier :)

And finally we fixed the context help for SetInverted.vi (LabVIEW), this was reported by a team.  

This minor update also *provides an opportunity for *C++/Java team become familiar with the "Update" instructions* for third-party libraries.
Be sure to review the `update instructions <https://phoenix-documentation.readthedocs.io/en/latest/ch05a_CppJava.html#frc-c-java-updating-phoenix>`_

Balance Bot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Last year during the Worlds Championships, we revealed a 2-wheeled balance bot using our HERO control system.
Although I don't expect any competition robots to employ the same drive train, we recently have been getting a few questions about it, only to realize we never posted the files!

The `CAD and source <https://github.com/CrossTheRoadElec/CTRE-Balance-Bot>`_ is now available on GitHub.





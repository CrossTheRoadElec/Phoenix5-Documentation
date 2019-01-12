Prepare your workstation computer
=================================

Before Installing Phoenix...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
It is strongly recommended to complete the base installation of FRC tools.
https://wpilib.screenstepslive.com/s/currentCS/m/getting_started/l/144981-frc-software-component-overview

.. warning:: You will need to image the roboRIO to 2019 software before continuing.  The **roboRIO** kickoff versions are **image 2019_v12 and firmware 6.0**.

Test base FRC Installation - FRC LabVIEW
----------------------------------------------------------------------------------
If a team intends to use LabVIEW to develop robot software, be sure to complete the full NI installer.  At which point, opening LabVIEW should reveal the FRC-styled graphical start menu.

At this point it is recommended to create a simple template project and test deploy to the roboRIO.  Be sure the DriverStation can communicate with the robot controller, and that DS message log is functional.

.. note:: LabVIEW is versioned 2018 due to its release schedule. Therefore, LV2018 is used for the 2019 season.

Test base FRC Installation - FRC C++ / Java
----------------------------------------------------------------------------------
It is recommended to install the FRC Driver Station Utilities. This will install the Driver Station software, which is necessary for:

1. Basic comms checks
2. Reading joystick data
3. Generally required for enabling motor actuation (Phoenix Tuner provides an alternative).


Important note regarding FRC 2019 C++ / Java.
----------------------------------------------------------------------------------
The FRC C++/Java standard distribution for 2019 is **quite different** than previous seasons. WPILIB has replaced the Eclipse-based development environment with Microsoft Visual Studio Code and GradleRIO.

This is a considerable change in both user experience and in implementation. If you are developing C++/Java FRC programs, we strongly recommend testing full deployment to your robot controller before installing Phoenix and porting previous season software.
A recommended test is to:

1. Create a project from scratch
2. Make a simple change such as add a print statement with a counter.
3. Deploy (or debug) your application.
4. Confirm robot can be teleop-enabled in DS.
5. Open FRC message Console and read through all the messages.
6. Repeat 2 - 5 ten times. This will train students to become familiar with and build general confidence in the tools.

.. note:: Third-party vendor libraries are installed into the C++/Java project, not the environment.  For each C++/Java project you create, you must use the WPI provided tools to select Phoenix to bring the libraries into your project.



What to Download (and why)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Option 1: Windows installer (strongly recommended)
----------------------------------------------------------------------------------
Environments: Windows-LabVIEW, Windows-C++/Java, HERO C#

Phoenix Installer zip can be downloaded at:

http://www.ctr-electronics.com/hro.html#product_tabs_technical_resources.

It is typically named Phoenix Framework_Windows_vW.X.Y.Z.zip

This will install:

- The LabVIEW Phoenix API (if LabVIEW is detected and selected in installer)
- The C++/Java Phoenix API (if selected in installer)
- Device Firmware Files (that were tested with the release)
- CTRE Support of RobotBuilder
- Phoenix Tuner

  - Installs Phoenix API libraries into the roboRIO (required for LabVIEW)
  - Installs Phoenix Diagnostics Server into the RoboRIO (needed for CAN diagnostics). 
  - Plotter/Control features
  - Self-test
  - Device ID and field-upgrade


Option 2: Phoenix API via Non-Windows Zip 
----------------------------------------------------------------------------------
Environments: Linux/MacOS - C++/Java

The Phoenix API can be manually installed on non-Windows platforms by downloading the “non-Windows” zip and following the instructions found inside.  

This essentially contains a maven-style repository that holds the API binaries and headers, as well as a “vendordeps” JSON file that instructs VS how to incorporate the Phoenix C++/Java API libraries.

.. note:: This is auto installed when using the Windows full installer (Option 1).


Phoenix Tuner
----------------------------------------------------------------------------------
Environments: Windows

If you are using option 2, you will need to download Phoenix Tuner separately.  
Phoenix Tuner is available here...
https://github.com/CrossTheRoadElec/Phoenix-Tuner-Release/releases

This can be convenient for workstations that aren’t used for software development, but are used for field-upgrade or testing motor controllers.

.. note:: LabVIEW teams may need to use Phoenix Tuner to install Phoenix libraries into the roboRIO.  More information on this can be found under Prepare Robot Controller.

.. note:: This is auto installed when using the Windows full installer.

.. note:: Developers may be interested to know that all Phoenix Tuner features leverage an HTTP API provided by the Phoenix Diagnostics Server. As such, custom tooling can be developed to field-upgrade, test-control, or diagnostics CTRE devices without Tuner.


Device Firmware Files (crf)
----------------------------------------------------------------------------------
The test firmware files for all CTRE devices are packaged with the Windows Installer (and has been for years).  However, many FRC teams don’t notice, or prefer to download them directly from the product pages on the ctr-electronics.com website.  If Internet access is available, they can be downloaded as such.

The FRC Software installer will create a directory with various firmware files/tools for many control system components.  
Typically, the path is:

.. code-block:: html

  C:\Users\Public\Documents\FRC
 

.. image:: img/crf.png
 
When the path is entered into a browser, the browser may fix-up the path:


.. code-block:: html

   C:\Users\Public\Public Documents\FRC


In this directory are the initial release firmware CRF files for all CTRE CAN bus devices, including the Talon SRX. 

The latest firmware to be used at time of writing is version 4.11 for Talon SRX, Victor SPX, and 4.00 for CANifier, and Pigeon IMU.

.. note:: Additionally, newer updates may be provided online at http://www.ctr-electronics.com.

.. note:: Be sure to watch for team updates for what is legal and required!

.. note:: There is no longer FRC versus non-FRC firmware for motor controllers.  Instead the latest firmware detects if the use case is FRC.  If so, the device will FRC-Lock, and will require the Driver Station for actuation.  


Workstation Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are three installation methods listed below.  The simplest and recommended approach is to run the Windows Installer (Option 1).

Option 1: Windows Offline Installer (C++/Java/LabVIEW, HERO C#)
----------------------------------------------------------------------------------
Un-compress the downloaded zip.

.. image:: img/exe.png

Double click on the installer. If the Windows protection popup appears press More Info, then Run anyway.

.. image:: img/prot-1.png

.. image:: img/prot-2.png

.. image:: img/prot-3.png

This will look very similar to previous installers - make sure you have the relevant component selected for your programming language.

.. image:: img/install-1.png

LV Teams: Make sure LabVIEW is selected.  If it is grayed out, then LabVIEW was not installed on the PC.

C++/Java Teams: Make sure C++/Java is selected.  

If Visual Studio 2017 (Community/Professional) is detected, HERO C# will be selected.  This can be turned off to speed up the installer.

.. image:: img/install-2a.png

Installer can take anywhere from 30 seconds to 5 minutes depending on which Microsoft runtimes need to be installed.

.. image:: img/install-3.png

Final page will look like this.  The Phoenix Tuner link can be used to open Phoenix Tuner.  Alternatively, you can use the Windows Start Menu.

.. image:: img/install-4.png

Option 2: Non-Windows Zip  (C++/Java)
----------------------------------------------------------------------------------

The zip will contain **two folders, “maven” and “vendordeps”**.
These folders are meant to be **inserted into your frc2019 install folder**.  

See WPI documentation for typical location.
https://wpilib.screenstepslive.com/s/currentCS/m/cpp/l/1027500-installing-c-and-java-development-tools-for-frc

**Copy/paste the maven and vendordeps folder into frc2019 folder**.  This will override a pre-existing Phoenix installation if present.

.. note:: This will not install Phoenix Tuner or firmware files.  If these are necessary (and they typically are) these can be downloaded separately or consider using the complete Phoenix Installer.


Post Installation Steps
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After all workstation installs, the following checks should be followed to confirm proper installation.

FRC C++/Java - Verify Installation
----------------------------------------------------------------------------------

The offline files for vscode are typically installed in:

.. code-block:: html

  C:\Users\Public\frc2019\vendordeps\Phoenix.json (File used by vscode to include Phoenix in your project)
  C:\Users\Public\frc2019\maven\com\ctre\phoenix (multiple maven-style library files)


Your drive letter may be different than "C:".
After running the Phoenix Installer, the instructions to add or update Phoenix in your robot project must be followed.



FRC LabVIEW – Verify Installation
----------------------------------------------------------------------------------

After running the installer, open a pristine copy of FRC LabVIEW.

Testing the install can be done by opening LabVIEW and confirming the VIs are installed. This can be done by opening an existing project or creating a new project, or opening a single VI in LabVIEW. Whatever the simplest method to getting to the LabVIEW palette.

The CTRE Palette is located in:

• WPI Robotics Library -> Third Party.

.. image:: img/lv-paletteMenu.png

This palette can also be found in:

• WPI Robotics Library -> RobotDrive -> MotorControl -> CanMotor
• WPI Robotics Library -> Sensors -> Third Party
• WPI Robotics Library -> Actuators -> Third Party

FRC Windows – Open Phoenix Tuner
----------------------------------------------------------------------------------
Open Phoenix Tuner

.. image:: img/tuner-1.png

If this is the first time opening application, confirm the following:

- the status bar should read “Lost Comm”.
- No CAN devices will appear.
- The Server version will be unknown.

.. image:: img/tuner-2.png

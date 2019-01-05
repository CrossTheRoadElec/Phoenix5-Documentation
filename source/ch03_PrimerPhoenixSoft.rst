Primer: What is Phoenix Software
================================
Phoenix is a package that targets LabVIEW, C++, and Java for the FRC Robotics Controller platform, i.e. the  NI roboRIO robot controller. 

It includes the Application Programming Interface (API), which are the functions you call to manipulate the CTRE CAN bus devices: Talon SRX, Victor SPX, CANifier, and Pigeon IMU.

NOTE: PCM and PDP API are built into the core WPI distribution.

The C++ and Java APIs are very similar, typically only differing on the function name case (configAllSettings in Java versus ConfigAllSettings in C++).  Because Java is far more popular in FRC than Java, this document will reference the Java routine names.  C++ users should take note that the leading character of every function is UPPERCASE in C++.

Additionally, Phoenix shared libraries are also targeted for C++ on Linux (amd64, armhf, arm64) and typically available on our maven repository.  The example support libraries use socket-can for CANBus access, however custom drivers can be provided by the end user for alternative CANBus solutions (NVIDEA TX2 native CAN bus for example).

Phoenix also includes a NETMF (C#) class library for the non-FRC HERO Robot Controller.
This can replace the roboRIO in use cases that don’t require the full features of the FRC control system, and are not in use during competition.

.. note:: Phoenix framework is designed so that it is possible to control/leverage Talons, Victors, Pigeons, CANifiers outside of the roboRIO (Rasp Pi + socket CAN for example), and use the roboRIO/DriverStation for safely enable/disable the actuators.  Whether this is FRC legal will depend on the 2019 FRC rules.

There are tons of examples in all languages at CTRE’s GitHub account:

- https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages
- https://github.com/CrossTheRoadElec/Phoenix-Examples-LabVIEW

Entire GitHub organization: https://github.com/CrossTheRoadElec/

Phoenix-Examples-Languages and Phoenix-Examples-LabVIEW are specifically tested on the FRC RoboRIO control system.

Phoenix-Linux-SocketCAN-Example demonstrates control of Talons from a RaspBerry Pi.

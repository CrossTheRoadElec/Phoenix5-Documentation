# Phoenix Framework

![Title](images/title.png)

The software framework for all CTR-Electronics robot components.

See what control components make sense for your robotic needs at [CTR-Electronics](https://www.ctr-electroniocs.com).

---

Need info? Check the [Wiki](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | or [Create an issue](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | Check [our Store](https://ctr-electronics.com)

---
## Table of Contents

- [Purpose of this guide](https://github.com/CrossTheRoadElec/Phoenix-Documentation#purpose-of-this-guide)
- [Hardware setup](https://github.com/CrossTheRoadElec/Phoenix-Documentation#what-hardware-is-supported)
- [Before you write any software!](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Installing Phoenix Framework into PC](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Installing Phoenix Framework into your robot](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Install Internet Explorer 11](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Test the install](https://github.com/CrossTheRoadElec/Phoenix-Documentation#test-the-install)
- [Everything is installed, can I write software now?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Check the web-based configuration](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Set your device IDs](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Update your CAN Devices](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Pick the device names](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Self-Test the hardware](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [Where is the API?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#motor-controllers)
  - [C++ - How to intellisense/What header ](https://github.com/CrossTheRoadElec/Phoenix-Documentation#motor-controllers)
  - [Java - How to intellisense/What to import ](https://github.com/CrossTheRoadElec/Phoenix-Documentation#motor-controllers)
  - [LabVIEW - Where are the VIs? ](https://github.com/CrossTheRoadElec/Phoenix-Documentation#motor-controllers)
- [Hardware Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Motor Controllers](https://github.com/CrossTheRoadElec/Phoenix-Documentation#motor-controllers)
    - [Where to begin?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Factory Default the Configuration Parameters](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Open-Loop (No Sensor) Control](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Pick your direction](https://github.com/CrossTheRoadElec/Phoenix-Documentation#pick-your-neutral-mode)
      - [Pick your neutral mode](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Current limiting](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Ramping](https://github.com/CrossTheRoadElec/Phoenix-Documentation#Ramping)
      - [Follower](https://github.com/CrossTheRoadElec/Phoenix-Documentation#Follower)
    - [Setup Limit Switches](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Closed-Loop (Using Sensor) Control](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Sensors](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Why bother with sensors?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [How do I choose the sensor?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [How do I know the sensor works?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Sensor phase and why it matters](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [What are the units?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Setup the soft limits](https://github.com/CrossTheRoadElec/Phoenix-Documentation#setup-the-soft-limits)
      - [Closed-Loop/Firmware Control Modes](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Current closed-loop walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [I want to process the sensor myself.  How do I do that?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#setup-the-soft-limits)
    - [Current limiting](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Status Frames and how to tweak them](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Accessing the raw signals on the Gadgeteer port](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Multi-purpose/Sensor Devices](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Pigeon IMU](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Where to begin?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [CANifier](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Where to begin?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Common Device API](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Error handling](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Detecting error conditions](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Did my device reset?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Is the device on the CAN bus?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Configuration Parameters - General Guide lines](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Configuration Parameters - Why the timeout?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Configuration Parameters - Why the general API?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [Software Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Gearbox Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Why use Gearbox objects?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Drivetrain Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Why use Gearbox objects?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Servo Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Programming language Servo Walkthroughs](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Language: Velocity Servo walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Language: Motion Magic/Position Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Language: Motion Magic with Arc Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [LabVIEW Servo walkthroughs](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [LabVIEW: Velocity Servo walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [LabVIEW: Motion Magic/Position Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [LabVIEW: Motion Magic with Arc Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [Driver Station / Logger errors](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [What do I do when I see errors in Driver Station?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [CRF Firmware Version](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)

## Purpose of this guide
Really compelling stuff goes here.

## Hardware setup
Text here.

## Before you write any software!
Installation explanation

## Installing Phoenix Framework into your robot
Installation instructions

## Test the install
Eclipse Screenshot of Phoenix library.
Eclipse Screenshot of LV pallete.


### Motor Controllers
 CTRE provides two CAN/PWM motor controller options...
- [Victor SPX](http://www.ctr-electronics.com/victor-spx.html)
- [Talon SRX](http://www.ctr-electronics.com/talon-srx.html)

#### Where to begin? Create the object.
The first step of controlling a motor controller is to instantiate the controller in your robot controller software.

If using LabVIEW, use the Open VI corresponding to your motor controller.  Here we are creating an object for the Talon with device ID 15.
![](images/lVOpenTalon.png)

If using a programming language, create a TalonSRX object using the appropriate class name.
` private TalonSRX m_Wheel = new TalonSRX(15); `

Regardless of the what the motor controller is used for, the next step is usually open-loop (no sensor) control.  This is to ensure the mechanism is functional and that the motor and motor controller is wired correctly.

Start with the open-loop features below and configure each setting that is applicable.
#### Open-Loop (No Sensor) Control
These features and configurations influence the behavior of the motor controller when it is directly controlled by the robot controller.
#### Pick your direction
The
#### Pick your neutral mode
Text here.
#### Current limiting
Text here.
#### Ramping
Text here.
#### Follower
Text here.

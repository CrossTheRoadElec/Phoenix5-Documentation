# Phoenix Framework

![Title](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/images/title.png)

The software framework for all CTR-Electronics robot components.

See what control components make sense for your robotic needs at [CTR-Electronics](https://www.ctr-electroniocs.com).

---

Need info? Check the [Wiki](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | or [Create an issue](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | Check [our Store](https://ctr-electronics.com)

---
## Table of Contents

- [Hardware setup](https://github.com/CrossTheRoadElec/Phoenix-Documentation#what-hardware-is-supported)
- [Before you write any software!](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Installing Phoenix Framework into PC](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Installing Phoenix Framework into your robot](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Test the install](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
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
    - [Open-Loop (No Sensor) Control](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Pick your direction](https://github.com/CrossTheRoadElec/Phoenix-Documentation#pick-your-neutral-mode)
      - [Pick your neutral mode](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Current limiting](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Ramping](https://github.com/CrossTheRoadElec/Phoenix-Documentation#Ramping)
      - [Follower](https://github.com/CrossTheRoadElec/Phoenix-Documentation#Follower)
    - [Limit Switches](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Closed-Loop (Using Sensor) Control](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Sensors](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Why bother with sensors?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [How do I choose the sensor?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [How do I know the sensor works?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [Sensor phase and why it matters](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
        - [What are the units?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
      - [Closed-Loop Control Modes](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Status Frames and how to tweak them](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
  - [Sensors](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [Pigeon IMU](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
    - [CANifier](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [Drivetrain Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [Servo Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)
- [CRF Firmware Version](https://github.com/CrossTheRoadElec/Phoenix-Documentation#todo)

## Hardware setup
Text here.

### Motor Controllers
 CTRE provides two CAN/PWM motor controller options...
- Victor SPX
- [Talon SRX](http://www.ctr-electronics.com/talon-srx.html)

#### Where to begin? Create the object.
The first step of controlling a motor controller is to instantiate the controller in your robot controller software.

If using LabVIEW, use the Open VI corresponding to your motor controller.  Here we are creating an object for the Talon with device ID 15.
![](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/images/lVOpenTalon.png)

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

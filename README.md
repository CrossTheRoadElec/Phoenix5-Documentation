# Phoenix Framework
<p align = "center">
  ![Title](images/title.png)
</p>


The software framework for all CTR-Electronics robot components.

See what control components make sense for your robotic needs at [CTR-Electronics](https://www.ctr-electroniocs.com).

---

Need info? Check the [Wiki](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | or [Create an issue](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | Check [our Store](https://ctr-electronics.com)

---
## Table of Contents

- [Purpose of this guide](https://github.com/CrossTheRoadElec/Phoenix-Documentation#purpose-of-this-guide)
- [Hardware setup](https://github.com/CrossTheRoadElec/Phoenix-Documentation#hardware-setup)
- [Before you write any software!](https://github.com/CrossTheRoadElec/Phoenix-Documentation#before-you-write-any-software)
  - [Installing Phoenix Framework onto PC](https://github.com/CrossTheRoadElec/Phoenix-Documentation#installing-phoenix-framework-onto-pc)
  - [Installing Phoenix Framework into your robot](https://github.com/CrossTheRoadElec/Phoenix-Documentation#installing-phoenix-framework-into-your-robot)
  - [Install Internet Explorer 11](https://github.com/CrossTheRoadElec/Phoenix-Documentation#installing-internet-explorer-11)
  - [Test the install](https://github.com/CrossTheRoadElec/Phoenix-Documentation#test-the-install)
- [Everything is installed, can I write software now?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#everything-is-installed-can-i-write-software-now)
  - [Check the web-based configuration](https://github.com/CrossTheRoadElec/Phoenix-Documentation#check-the-web-based-configuration)
  - [Set your device IDs](https://github.com/CrossTheRoadElec/Phoenix-Documentation#set-your-device-ids)
  - [Update your CAN Devices](https://github.com/CrossTheRoadElec/Phoenix-Documentation#update-your-can-devices)
  - [Pick the device names](https://github.com/CrossTheRoadElec/Phoenix-Documentation#pick-the-device-names)
  - [Self-Test the hardware](https://github.com/CrossTheRoadElec/Phoenix-Documentation#self-test-the-hardware)
- [Where is the API?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#where-is-the-api)
  - [C++ - How to intellisense/What header ](https://github.com/CrossTheRoadElec/Phoenix-Documentation#c---how-to-intellisensewhat-header)
  - [Java - How to intellisense/What to import ](https://github.com/CrossTheRoadElec/Phoenix-Documentation#java---how-to-intellisensewhat-to-import)
  - [LabVIEW - Where are the VIs? ](https://github.com/CrossTheRoadElec/Phoenix-Documentation#labview---where-are-the-vis)
- [Hardware Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#hardware-object-model)
  - [Motor Controllers](https://github.com/CrossTheRoadElec/Phoenix-Documentation#motor-controllers)
    - [Where to begin?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#where-to-begin)
    - [Factory Default the Configuration Parameters](https://github.com/CrossTheRoadElec/Phoenix-Documentation#factory-default-the-configuration-parameters)
    - [Open-Loop (No Sensor) Control](https://github.com/CrossTheRoadElec/Phoenix-Documentation#open-loop-no-sensor-control)
      - [Pick your direction](https://github.com/CrossTheRoadElec/Phoenix-Documentation#pick-your-direction)
      - [Pick your neutral mode](https://github.com/CrossTheRoadElec/Phoenix-Documentation#pick-your-neutral-mode)
      - [Current limiting](https://github.com/CrossTheRoadElec/Phoenix-Documentation#current-limiting)
      - [Ramping](https://github.com/CrossTheRoadElec/Phoenix-Documentation#ramping)
      - [Follower](https://github.com/CrossTheRoadElec/Phoenix-Documentation#follower)
    - [Setup Limit Switches](https://github.com/CrossTheRoadElec/Phoenix-Documentation#setup-limit-switches)
    - [Closed-Loop (Using Sensor) Control](https://github.com/CrossTheRoadElec/Phoenix-Documentation#closed-loop-using-sensor-control)
      - [Sensors](https://github.com/CrossTheRoadElec/Phoenix-Documentation#sensors)
        - [Why bother with sensors?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#why-bother-with-sensors)
        - [How do I choose the sensor?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#how-do-i-choose-the-sensor)
        - [How do I know the sensor works?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#how-do-i-know-the-sensor-works)
        - [Sensor phase and why it matters](https://github.com/CrossTheRoadElec/Phoenix-Documentation#sensor-phase-and-why-it-matters)
        - [What are the units?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#what-are-the-units)
        - [Setup the soft limits](https://github.com/CrossTheRoadElec/Phoenix-Documentation#setup-the-soft-limits)
      - [Closed-Loop/Firmware Control Modes](https://github.com/CrossTheRoadElec/Phoenix-Documentation#closed-loopfirmware-control-modes)
        - [Postion closed-loop walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#position-close-loop-walkthrough)
        - [Current closed-loop walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#current-closed-loop-walkthrough)
      - [I want to process the sensor myself.  How do I do that?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#i-want-to-process-the-sensor-myself-how-do-i-do-that)
    - [Current limiting](https://github.com/CrossTheRoadElec/Phoenix-Documentation#current-limiting-1)
    - [Status Frames and how to tweak them](https://github.com/CrossTheRoadElec/Phoenix-Documentation#status-frames-and-how-to-tweak-them)
    - [Accessing the raw signals on the Gadgeteer port](https://github.com/CrossTheRoadElec/Phoenix-Documentation#accessing-the-raw-signals-on-the-gadgeteer-port)
  - [Multi-purpose/Sensor Devices](https://github.com/CrossTheRoadElec/Phoenix-Documentation#multi-purposesensor-devices)
    - [Pigeon IMU](https://github.com/CrossTheRoadElec/Phoenix-Documentation#pigeon-imu)
      - [Where to begin?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#where-to-begin)
    - [CANifier](https://github.com/CrossTheRoadElec/Phoenix-Documentation#canifier)
      - [Where to begin?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#where-to-begin-1)
  - [Common Device API](https://github.com/CrossTheRoadElec/Phoenix-Documentation#common-device-api)
      - [Error handling](https://github.com/CrossTheRoadElec/Phoenix-Documentation#error-handling)
      - [Detecting error conditions](https://github.com/CrossTheRoadElec/Phoenix-Documentation#detecting-error-conditions)
        - [Did my device reset?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#did-my-device-reset)
        - [Is the device on the CAN bus?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#is-the-device-on-the-can-bus)
      - [Configuration Parameters - General Guide lines](https://github.com/CrossTheRoadElec/Phoenix-Documentation#configuration-parameters---general-guide-lines)
        - [Configuration Parameters - Why the timeout?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#configuration-parameters---why-the-timeout)
        - [Configuration Parameters - Why the general API?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#configuration-parameters---why-the-general-api)
- [Software Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#software-object-model)
  - [Gearbox Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#gearbox-model)
      - [Why use Gearbox objects?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#why-use-gearbox-objects)
  - [Drivetrain Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#drivetrain-model)
      - [Why use Drivetrain objects?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#why-use-drivetrain-objects)
  - [Servo Object Model](https://github.com/CrossTheRoadElec/Phoenix-Documentation#servo-object-model)
    - [Programming language Servo Walkthroughs](https://github.com/CrossTheRoadElec/Phoenix-Documentation#programming-language-servo-walkthroughs)
      - [Language: Velocity Servo walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#language-velocity-servo-walkthrough)
      - [Language: Motion Magic/Position Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#language-motion-magicposition-servo-walkthrough)
      - [Language: Motion Magic with Arc Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#language-motion-magic-with-arc-servo-walkthrough)
    - [LabVIEW Servo walkthroughs](https://github.com/CrossTheRoadElec/Phoenix-Documentation#labview-servo-walkthroughs)
      - [LabVIEW: Velocity Servo walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#labview-velocity-servo-walkthrough)
      - [LabVIEW: Motion Magic/Position Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#labview-motion-magicposition-servo-walkthrough)
      - [LabVIEW: Motion Magic with Arc Servo Walkthrough](https://github.com/CrossTheRoadElec/Phoenix-Documentation#labview-motion-magic-with-arc-servo-walkthrough)
- [Driver Station / Logger errors](https://github.com/CrossTheRoadElec/Phoenix-Documentation#driver-station--logger-errors)
  - [What do I do when I see errors in Driver Station?](https://github.com/CrossTheRoadElec/Phoenix-Documentation#what-do-i-do-when-i-see-errors-in-driver-station)
- [CRF Firmware Version](https://github.com/CrossTheRoadElec/Phoenix-Documentation#crf-firmware-version)

## **Purpose of this guide**
Really compelling stuff goes here.

## **Hardware setup**
Text here.

## **Before you write any software!**
Installation explanation
### Installing Phoenix Framework onto PC
### Installing Phoenix Framework into your robot
Installation instructions
### Installing Internet Explorer 11
### Test the install
Eclipse Screenshot of Phoenix library.
Eclipse Screenshot of LabVIEW palette.

## **Everything is installed, can I write software now?**
### Check the web-based configuration
### Set your device IDs
### Update your CAN Devices
### Pick the device names
### Self-Test the hardware

## **Where is the API**
### C++ - How to intellisense/What header
### Java - How to intellisense/What to import
### LabVIEW - Where are the VIs?


## **Hardware Object Model**
### Motor Controllers
 CTRE provides two CAN/PWM motor controller options...
- [Victor SPX](http://www.ctr-electronics.com/victor-spx.html)
- [Talon SRX](http://www.ctr-electronics.com/talon-srx.html)

#### Where to begin? Create the object.
The first step of controlling a motor controller is to instantiate the controller in your robot controller software.

If using LabVIEW, use the Open VI corresponding to your motor controller.  Here we are creating an object for the Talon with device ID 15.
![](images/lVOpenTalon.png)

If using a programming language, create a Talon SRX object using the appropriate class name.

` private TalonSRX m_Wheel = new TalonSRX(15); `

Regardless of the what the motor controller is used for, the next step is usually open-loop (no sensor) control.  This is to ensure the mechanism is functional and that the motor and motor controller is wired correctly.

Start with the open-loop features below and configure each setting that is applicable.

#### Factory Default the Configuration Parameters
Both the Talon SRX and Victor SPX have some persistent settings such as neutral mode, limit switches, soft limits, PID gains and a few others. These settings can be reverted to factory defaults by holding the B/C button on the Talon SRX and Victor SPX.

1. Hold down the B/C CAL button until both status LEDS begin to rapidly blink red and green.
2. Release the B/C CAL button.
3. If the Talon SRX was calibrated properly, the status LEDs will blink green several times. If the calibration failed, the status LEDs will blink red and the previous calibration will be kept.

<p align = "center">
  ![Talon SRX's B/C Button](images/README-e92dd4b0.png)
</p>

#### Open-Loop (No Sensor) Control
These features and configurations influence the behavior of the motor controller when it is directly controlled by the robot controller.
##### Pick your direction
Direction of output from a motor controller can be set by calling the `setInverted()` function as seen below. LEDs, sensor phase, and limit switches will also be inverted as well to match the direction of output.

Pass in false if the signage of the motor controller is correct, else pass in true to reverse direction.

Java - `Hardware.Talon.setInverted(false);`

C++ -

LabVIEW -
##### Pick your neutral mode
Mode of operation during Neutral throttle output may be set by using the `setNeutralMode()` function.
As of right now, there are two options when setting the neutral mode of a motor controller, brake and coast.

Java - `Hardware.Talon.setNeutralMode(com.ctre.phoenix.MotorControl.NeutralMode.Coast);`
`Hardware.Talon.setNeutralMode(com.ctre.phoenix.MotorControl.NeutralMode.Brake);`

C++ -

LabVIEW -
##### Current limiting
Current limiting configuration and enabling can be controlled by the following API.

1. Set the ContinousCurrentLimit as that configures the value to limit the current to.
2. Second, set the PeakCurrentLimit as that sets what current threshold will enforce the current limit. If PeakCurrentLimit is set to 0, current limiting will be enforced at the ContinousCurrentLimit value.
3. Set the PeakCurrentDuration as that sets how long the current can be over the peak before enforcing current limiting. If PeakCurrentDuration is set to 0, always enforce current limiting .
4. Enable the current limiting.

Java - The following java example limits the current to 10 amps whenever the current has exceeded 15 amps for 100 Ms.
`Hardware.Talon.configContinuousCurrentLimit(10, 0);`
`Hardware.rightMaster.configPeakCurrentLimit(15, 0);`
`Hardware.leftMaster.configPeakCurrentDuration(100, 0);`
`Hardware.rightMaster.enableCurrentLimit(true);`

C++ - The following C++ example limits current to 15 amps at all times, working the same way as the 2017 Framework. **Do this with Victor SPX**

LabVIEW -
##### Ramping
The Talon SRX and Victor SPX can be set to honor a ramp rate to prevent instantaneous changes in throttle.

The open-loop ramp rate of a motor controller can be configured by using the `configOpenloopRamp();` function. The function takes two parameters and returns a Error code generated by the function if the configuration fails to complete within the timeout.

Java - Talon is configured to ramp from neutral to full within a 5 seconds. `Hardware.Talon.configOpenloopRamp(5, 0);`

C++ -

LabVIEW -
##### Follower
Both the Talon SRX and Victor SPX has a follower feature that allows the motor controllers to mimic another motor controller's output. Users will still need to set the motor controller's direction, neutral mode, and **??**

There are two methods for creating a follower motor controller. The first method `set(ControlMode.Follower, int IDofMotorToFollow)` allows users to create a motor controller follower of the same model, talon to talon, or victor to victor.

The second method `follow(IMotorcontroller MasterToFollow)` allows users to create a motor controller follower of not only the same model, but also other models, talon to talon, victor to victor, talon to victor, and victor to talon.

Java - 		
`Hardware.VictorFollower.follow(Hardware.TalonMaster);`
`Hardware.TalonFollower.set(com.ctre.phoenix.MotorControl.ControlMode.Follower, 6);`

C++ -

LabVIEW -

#### Setup Limit switches
An “out of the box” Talon SRX or Victor SPX will default with the limit switch setting of “Normally Open” for both forward and reverse. This means that motor drive is allowed when a limit switch input is not closed (i.e. not connected to ground). When a limit switch input is closed (is connected to ground) the Talon SRX/Victor SPX will disable motor drive and individually blink both LEDs red in the direction of the fault (red blink pattern will move towards the M+/white wire for positive limit fault, and towards M-/green wire for negative limit fault)


<p align = "center">
![Chart for limit switching](images/README-da0f78d6.png)
</p>

Limit switch features can be disabled or changed to “Normally Closed” in the RoboRIO web-based configuration. Changing the settings will take effect once the “Save” button is pressed. The settings are saved
in persistent memory.

<p align = "center">
![Webdash image](images/README-d3c40698.png)
</p>  

If the neutral mode or limit switch mode is changed in the RoboRIO web-based configuration, the motor controller will momentarily disable then resume motor drive. All other settings can be changed
without impacting the motor drive or enabled-state of the Talon SRX

#### Closed-Loop (Using Sensor) Control
These features and configurations influence the behavior of the motor controller when encoders/sensors are being used to provide feedback to a maneuver.
##### Sensors
Sensors for motor controllers provide feedback about the position, velocity, and acceleration of the system using that motor controller. The Talon SRX supports a wide variety of sensors while the Victor SPX is able to grab sensor data from another motor controller, which we call remote source.
###### Why bother with sensors?
Sensors allows both the motor controller and user to receive data and feedback. That information allows us to act upon different situations by giving us information about the motors position, speed, and acceleration. This information is especially important when implementing a close loop control, such as a PID control loop.
###### How do I choose the sensor?
***Not sure what to type here***
###### How do I know the sensor works?
There are multiple methods of ensuring the connected sensor is active and returning meaningful data. The best method is to plot the signal and watch the plot, looking for continuous data that is responsive. Another, but less reliable method is to print your values to a console and check for values, which makes it harder to see if there is noise in the values.

Java/C++ - For the FRC languages, the easiest way to produce a plot is to use the SmartDashboard, a feature part of the FRC Driver Station. Below is an example of how to set up the sensor on the Talon SRX and get a plot.

Java -
```java
/* Setup */
Hardware.rightMaster.configSelectedFeedbackSensor(com.ctre.phoenix.MotorControl.FeedbackDevice.QuadEncoder, 0);
Hardware.rightMaster.setSensorPhase(false);
Hardware.leftMaster.configSelectedFeedbackSensor(com.ctre.phoenix.MotorControl.FeedbackDevice.QuadEncoder, 0);
Hardware.leftMaster.setSensorPhase(false);

/* Output value to SmartDashboard */
SmartDashboard.putNumber("Right Sensor position", Hardware.rightMaster.getSelectedSensorPosition());
SmartDashboard.putNumber("Left Sensor Velocity", Hardware.leftMaster.getSelectedSensorVelocity());
```

Once you have deployed the code and opened SmartDashboard from the FRC Driver Station, you may reveal the values by going under the view tab and revealing the values which will be listed as their key name. You can then change the numerical indicator the a line-plot and generate the plot by driving the motor controller.

<p align = "center">
![Image of the plots generated from driving](images/README-5726bb08.png)
</p>

###### Sensor phase and why it matters
Sensor phase is the term used to explain sensor direction. In order for limit switches and closed-loop features to function properly the sensor and motor has to be “in-phase.” This means that the sensor position must move in a positive direction as the motor controller drives positive throttle. To test this, first drive the motor manually (using
gamepad axis for example). Watch the sensor position either in the ro boRIO web-based configuration Self-Test, plot using the method explained in the sub-section above, or by calling GetSensorPosition() and printing it to console.

**Not sure if this is still needed** |||||

In the special case of using the EncRising feedback device, "Reverse Feedback Sensor" will need to be false. This Feedback Device is guaranteed to be positive since it increments per rising edge, and never decrements. "Reverse Closed-Loop Output" can then be used to output
a negative motor duty-cycle. "Reverse Closed-Loop Output" can also be used to reverse a slave Talon SRX to be the signed opposite of the master Talon SRX.


###### What are the units of my sensor?
**NotSureHowThisIsGoingToWorkYet**

###### Setup the soft limits
Soft limits can be used to disable motor drive when the “Sensor Position” is outside of a specified range. Forward throttle will be disabled if the “Sensor Position” is greater than the Forward Soft Limit. Reverse throttle will be disabled if the “Sensor Position” is less than the Reverse Soft Limit. The respective Soft Limit Enable must be enabled for this feature to take
effect.

##### Closed-loop/Firmware Control Modes
Start here...
###### Position close-loop walkthrough
###### Current closed-loop walkthrough

##### I Want to process the sensor myself, How do I do that?

#### Current limiting
#### Status Frames and how to tweak them
#### Accessing the raw signals on the Gadgeteer port

### Multi-purpose/sensor Devices
#### Pigeon IMU
##### Where to begin?
#### CANifier
##### Where to begin?

### Common Device API
#### Error handling
#### Detecting error conditions
##### Did my device reset?
##### Is the device on the CAN bus?
#### Configuration Parameters - General Guide lines
##### Configuration Parameters - Why the timeout?
##### Configuration Parameters - Why the general API?

## **Software Object Model**
### Gearbox Model
#### Why use Gearbox objects?
### Drivetrain Model
#### Why use Drivetrain objects?
### Servo Object Model
#### Programming language Servo Walkthroughs
##### Language: Velocity Servo walkthrough
##### Language: Motion Magic/Position Servo Walkthrough
##### Language: Motion Magic with Arc Servo Walkthrough
#### LabVIEW Servo walkthroughs
##### LabVIEW: Velocity Servo walkthrough
##### LabVIEW: Motion Magic/Position Servo Walkthrough
##### LabVIEW: Motion Magic with Arc Servo Walkthrough

## **Driver Station / Logger errors**
### What do I do when I see errors in Driver Station?

## **CRF Firmware Version**

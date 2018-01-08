# Phoenix Framework Migration Guide
![Title](images/General-Title.png)

---

API Docs [Java](http://www.ctr-electronics.com/downloads/api/java/html/index.html) [C++](http://www.ctr-electronics.com/downloads/api/cpp/html/index.html) | [2018 Documentation](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md) | Examples: [Java/C++](https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages)/[LabVIEW](https://github.com/CrossTheRoadElec/Phoenix-Examples-LabVIEW) |  [Migration Guide](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/Migration%20Guide.md) | [Create an issue](https://github.com/CrossTheRoadElec/Phoenix-Documentation/issues) | [Store](https://ctr-electronics.com)

---

## **Migration Table**
| Description   |      HERO SDK v4/FRC-2017     |  Phoenix v5 | Details |
|---------|:-------------:|:------:|:---------------------|
|General|
|class name change|**CANTalon**|**TalonSRX** (com.ctre.phoenix. motorcontrol.can.TalonSRX)|Talon SRX are predominantly used on CAN Bus, therefore the CAN prefix was redundant.  For use in WPILib based applications, consider using the [`WPI_TalonSRX`](https://github.com/CrossTheRoadElec/Phoenix-Documentation#wpilib-speedcontrollerdrivetrain-objects) class.
|class name change|**TalonSRX**| **PWMTalonSRX** (edu.wpi. first.wpilibj.PWMTalonSRX)|Talon SRX still supports PWM.  This class is still maintained by the WPILIB team.
|Set|set(value) / changeControlMode(mode)|set(mode,value)|Single param set() and changeControMode() have been replaced with a two parameter set(). Because value is dependent on the mode, having seperate functions caused confusion in previous seasons.  For WPI classes that use the single param set, use the [`WPI_TalonSRX`](http://www.ctr-electronics.com/downloads/api/java/html/com/ctre/phoenix/motorcontrol/can/WPI_TalonSRX.html) class.
|Control Modes|**PercentVBus**, Position, **Speed**, **Voltage**, Follower, Motion Profile, Motion Magic|**PercentOutput**, Position, **Velocity**, Follower, Motion Profile, Motion Magic|Voltage control mode was removed, PercentVBus renamed to PercentOutput, Speed renamed to Velocity|
|Get Motor Output|getOutputVoltage|getMotorOutputVoltage getMotorOutputPercent|Motor output can be accessed via output voltage or percent output|
|timeoutMs parameter|talon.func(XXX)|talon.func(XXX, timeoutMs)|Some routines can optionally wait for a response from the device up to a timeout.  If the response is never received, an error code is returned and the Drive Station will receive an error message.  Pass 0 to avoid blocking at all. When initializing device on robot-boot, we recommend passing 10ms.  When calling routines in the loop of the robot, pass zero to avoid blocking.|
|C++ Header|Individual files|"ctre/Phoenix.h"| Phoenix.h is a general header with several header includes and namespace scopes.  This single header is sufficient for a majority of cases.  If developer wants to avoid bringing in all of the namespaces, inspect the header for what includes are necessary and copy accordingly.
|Brake Mode|enableBrakeMode|setNeutralMode| Funcion has been renamed.|
|Voltage Compensation|
|...is not a Control Mode|setControlMode (CANTalon::kVoltage)| enableVoltage Compensation()|Voltage Compensation can be enabled/disabled in parallel to any control mode.|
|Setting compensation value for "full" output.||configVoltageComp Saturation (voltage, timeoutMs)| This is the voltage that the motor controller will compensate "full" output to.  For example, if 10V is configured for the saturation point, when the motor controller is commanded 50%, it will modulate until the output is 5V.  This applies to closed-loop modes as well.
|Low level sensor API (without sensor selection)|
|Accessing low level feedback sensor. |  getPulseWidthPosition() | getSensorCollection(). getPulseWidthPosition()| Low level functions that access sensor data directly are now tucked under the sensor collection object.
|Setting low level sensor.|talon.setEncPosition(newValue)|getSensorCollection(). setQuadraturePosition (pos, 10);|Same as above.  Also note that "Enc" has changed to "Quadrature".|
|Direction / sensor phase / follower  |
|Direction/Sensor flipping|reverseSensor / reverseOutput / setInvert / SetSensorDirection / (similar reverse functions)|talon.SetInvert / talon.SetSensorPhase| Use sensor phase to align positive sensor velocity to positive motor output.  Once this is done you will never have to call any reverse function for the purpose of alignment.  Use SetInvert to choose what motor direction to apply when positive output is applied (green LEDs)|
|Sensor Units|
|Sensor Get Methods||Has pidIdx parameter|Sensor Get Methods now have a PID Index parameter to specify which PID slot you are using. If you're not using Cascaded PID, this will be 0.
|Setting PIDF Values|setP(val) setI(val) setD(val) setF(val)|config_kP(val, timeoutMs) config_kI(val, timeoutMs) config_kD(val, timeoutMs) config_kF(val, timeoutMs)|PIDF values always use native units when calculating output|
|Position API|configEncoderCodesPerRev / configPotentiometerTurns|All Talon / Victor API uses sensor units|Positions are always in sensor units.  Quadrature units are 4X measurements where X units represents X quadrature edges.  Analog units are 1024 per voltage sweep from 0V to 3.3V (and wrapped back to 0V).  |
||getPosition|[getSelectedSensorPosition](http://www.ctr-electronics.com/downloads/api/java/html/com/ctre/phoenix/motorcontrol/can/BaseMotorController.html#getSelectedSensorPosition-int-)| The return value is in sensor units.  Sensor must be selected using configSelectedFeedbackSensor()/  Multiply by (1/SensorUnitsPerRotation) to convert into rotations.
|Velocity API|configEncoderCodesPerRev / configPotentiometerTurns|All Talon / Victor API uses sensor units per 100ms|Velocity units are always change in sensor units per 100ms, regardless of configuration.  Tachometer is always in units per 100ms, where each units is 1/1024 of a rotation.  |
||getSpeed|[getSelectedSensorVelocity](http://www.ctr-electronics.com/downloads/api/java/html/com/ctre/phoenix/motorcontrol/can/BaseMotorController.html#getSelectedSensorVelocity-int-)| The return value is in units per 100ms for all sensor types.  Sensor must be selected using configSelectedFeedbackSensor()/  Multiply by (600/SensorUnitsPerRotation) to convert into RPM.  
|Peak and Nominal outputs|
||configNominalOutputVoltage / configPeakOutputVoltage / | configPeakOutputForward / configPeakOutputReverse / configNominalOutputForward / configNominalOutputReverse| The inputs are now [-1,+1] which represents [-100%,+100], and not based on voltage.  This was never the case as last year the inputs where naively divided by 12.
|Factory Default - Press and hold B/C button on boot.|
||Resets PWM Calibration |Resets PWM Calibration  / Resets persistent CAN settings, EXCEPT for Device ID and Neutral Brake. | This should be done on any Talon when replacing/swapping/troubleshooting.  Because of the large number of persistent config settings, it is simpler to default all peak/nominal/measurement/etc configs first and only deliberately set the desired parameters in code.
|Selecting sensor|SetFeedbackDevice|ConfigSelectedFeedbackSensor|All Config* routines are persistent|
|Motion Profiling and Motion Magic||||
|Motion Magic Cruise Velocity|setMotionMagicCruiseVelocity|configMotionCruiseVelocity|Configures cruise velocity for motion magic|
|Motion Magic Acceleration| setMotionMagicAcceleration|configMotionAcceleration|Configures acceleration for motion magic|
|Ramping|setVoltageRampRate(double voltPerSec)|configOpenloopRamp(secondsFromNeutralToFull, timeoutMs), configClosedloopRamp(secondsFromNeutralToFull, timeoutMs)|Separate Ramp Rates for Open/Closed Loop.  Ramp expressed as seconds to go from neutral throttle to full throttle.|
|||||

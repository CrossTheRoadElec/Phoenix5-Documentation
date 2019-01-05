Bring Up: Talon SRX Sensors
===========================

This section is dedicated to validating any rotary sensor attached to the Talon SRX.
Generally attaching a sensor is necessary for:

- Close-Loop control modes (Position, MotionMagic, Velocity, MotionProfile)
- Soft limits (auto neutral motor if out of range)

For these features to function correctly, it is imperative to validate the sensor first.

Checking your wiring
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Inspect the entire wiring harness between the Talon SRX and the sensor.

If connectors/crimps are used, **tug-test each individual wire one at a time**.

.. tip:: If sensor is a CTRE Mag Encoder, inspect the ribbon cable for any frayed or damaged sections.

.. tip:: If sensor is a CTRE Mag Encoder, confirm green LED.  When using Versa-Planetary Sensor Slice, orange LED is acceptable.

.. warning:: When using a contactless sensor on a rolling mechanism (shooter / roller / intake), care should be taken to ensure spinning mechanism is electrically common to the remainder of the robot chassis.  Otherwise ESD strikes can occur between mechanism and the contactless sensor (due to its proximity to the mechanism).



Sensor Check – No Motor Drive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Open Phoenix Tuner, and select device in the top dropdown.

.. image:: img/sensor-3.png

Take an initial capture to first check the settled values (no motion).

.. tip:: Analog should read ~100 units if floating.  If analog sensor is meant to be in-circuit, recheck sensor signal/power/harness/etc.

.. tip:: Quadrature resets to 0 on power boot.

.. tip:: Pulse Width should report a period of ~4 milliseconds when using a CTRE Mag encoder.

.. tip:: If using Talon Tach to measure velocity, focus on “Velocity (if Tach)” under Pulse Width section.

.. image:: img/sensor-4.png


 


Sensor Options
------------------------------------------------------
Many feedback interfaces are supported.  The complete list is below.

Quadrature
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The Talon directly supports quadrature sensors.
The decoding is done in 4x mode (every edge on A and B are counted).
This is available via the Gadgeteer feedback port.

Analog (Potentiometer or Encoder)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Analog feedback sensors are sensors that provide a variable voltage to represent position.  Some devices (such as the MA3 US Digital encoder) are continuous and wrap around from 3.3V back to 0V.  In such cases the overwrap is tracked, and Talon continues counting 1023 => 1024.  

This feature can be disabled by setting the config via API or Tuner.

.. image:: img/sensor-22.png


Pulse Width Decoder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For sensors that encode position as a pulse width this mode can be used to decode the position.
The pulse width decoder is <1us accurate and the maximum time between edges is 120 ms.


Cross The Road Electronics Magnetic Encoder (Absolute and Relative)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The CTRE Magnetic Encoder is actually two sensor interfaces packaged into one (pulse width and quadrature encoder).
Therefore the sensor provides two modes of use: absolute and relative.  

.. image:: img/sensor-23.png

The advantage of absolute mode is having a solid reference to where a mechanism is without re-tare-ing or re-zero-ing the robot.  The advantage of the relative mode is the faster update rate.  However both values can be read/written at the same time.  So a combined strategy of seeding the relative position based on the absolute position can be used to benefit from the higher sampling rate of the relative mode and still have an absolute sensor position.
Parameter	Absolute Mode	Relative Mode
Update rate (period)	4ms	100 us
Max RPM	7,500 RPM	15,000 RPM
Accuracy	12 bits per rotation 
(4096 steps per rotation)	12 bits per rotation
(4096 steps per rotation)
Software API 	Use Pulse Width API	Use Quadrature API


In circumstances where the absolute pulse width wraps from one extremity to the other (due to overflow), the Talon continues counting 4095 => 4096.  

This feature can be disabled by setting the config via API or Tuner.

.. image:: img/sensor-22.png


Software Select Sensor Type
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Although all sensor values are available all the time, the Talon SRX generally requires the robot application to “pick” a particular “Feedback Device” for soft limit, closed-loop features, and plotter.

.. note:: The selected “Feedback Device” defaults to Quadrature Encoder.

Once a “Feedback Device” is selected, the “Sensor Position” and “Sensor Velocity” signals will update with the output of the selected feedback device.  

Select the sensor (under PID0 Primary) with either Phoenix API or using Tuner.

.. image:: img/sensor-5.png

In this example, pulse width position is selected (absolute position within rotation when using CTRE Mag Encoder).

.. image:: img/sensor-6.png

Take another self-test and notice the Selected Sensor (PID0) matches the selection.

.. image:: img/sensor-7.png

Manually rotate in one direction and take another self-test.  Confirm velocity is nonzero.

.. image:: img/sensor-8.png

Now spin the other way and confirm opposite polarity.

.. image:: img/sensor-9.png

Because the sensor is now “selected”, turn on the plot and hand rotate sensor back and forth. 
Disable plot to pause after capturing several seconds.

.. image:: img/sensor-10.png

Checks:

- Focus the velocity and position curves and look for any discontinuities in the plot.
- Shake the sensor harness while hand-turning mechanism.
- This is also a good opportunity to confirm the resolution of the sensor.

Selecting the CTRE Magnetic Encoder
------------------------------------------------------
Selecting the Magnetic Encoder for closed-loop / soft-limit features is no different than selecting other sensor feedback devices.  
Select Quadrature for the faster incremental/relative signal.  Select Pulse Width for the slower absolute (within one rotation) signal.



Sensor Check – With Motor Drive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In this step we will attempt to drive motor while monitoring sensor value.
Motor controller can be controlled using Control-tab (see previous relevant section) or controlled from robot application via Phoenix API (see previous relevant section).

Sensor Phase
------------------------------------------------------
Sensor phase describes the relationship between the motor output direction (positive vs negative) and sensor velocity (positive vs negative).  For soft-limits and closed-loop features to function correctly, the sensor measurement and motor output must be “in-phase”.





Measure Sensor Phase
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Take another measurement using your preferred control method and check the sensor phase using any of the following methods.

Here we sweep the motor output forward and reverse.  Notice that sensor velocity (green) and motor output (blue) are out of phase.

.. image:: img/sensor-11.png

In this capture we use the self-test to observe the motor output and selected (PID0) sensor velocity are signed in opposite directions.  Additionally the Talon SRX noticed this and reported a live fault of “Sensor Out of Phase”.

.. image:: img/sensor-12.png

.. note:: Talon SRX will check sensor direction versus output direction once motor output and velocity exceeds a minimum threshold.

Adjust Sensor Phase using API
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If the sensor is out of phase with the motor drive, you can use any method below to align them:

- **Recommended**: Use setSensorPhase routine/VI to adjust the sensor phase.  If already called, toggle the input so that the sensor phase becomes aligned with motor output.
- Exchange/flip the green/white motor leads.  **This is generally not recommended** as this makes maintaining motor controller orientation across multiple robots difficult (practice versus competition).

.. warning:: Do not use setInverted to correct sensor orientation with respect to motor output.  setInverted synchronously inverts both signals, ensuring that sensor phase is maintained.  **This is a feature** that allows you to choose what direction is considered positive without breaking closed-looping features.


Confirm Sensor Phase using API
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The next test is to control the motor controller using Phoenix API on the robot controller.

This is ultimately how you will leverage the motor controller in competition.

.. code-block:: java

  package frc.robot;
  
  import com.ctre.phoenix.motorcontrol.*;
  import com.ctre.phoenix.motorcontrol.can.*;
  import edu.wpi.first.wpilibj.*;
  
  public class Robot extends TimedRobot {
    TalonSRX _talon = new TalonSRX(0); /* make a Talon */
    Joystick _joystick = new Joystick(0); /* make a joystick */
    Faults _faults = new Faults(); /* temp to fill with latest faults */
  
    @Override
    public void teleopInit() {
      /* factory default values */
      _talon.configFactoryDefault();
  
      /*
       * choose whatever you want so "positive" values moves mechanism forward,
       * upwards, outward, etc...
       * 
       * Note that you can set this to whatever you want, but this will not fix motor
       * output direction vs sensor direction.
       */
      _talon.setInverted(false);
  
      /*
       * flip value so that motor output and sensor velocity are the same polarity. Do
       * this before closed-looping
       */
      _talon.setSensorPhase(false); // <<<<<< Adjust this
    }
  
    @Override
    public void teleopPeriodic() {
      double xSpeed = _joystick.getRawAxis(1) * -1; // make forward stick positive
  
      /* update motor controller */
      _talon.set(ControlMode.PercentOutput, xSpeed);
      /* check our live faults */
      _talon.getFaults(_faults);
      /* hold down btn1 to print stick values */
      if (_joystick.getRawButton(1)) {
        System.out.println("Sensor Vel:" + _talon.getSelectedSensorVelocity());
        System.out.println("Sensor Pos:" + _talon.getSelectedSensorPosition());
        System.out.println("Out %" + _talon.getMotorOutputPercent());
        System.out.println("Out Of Phase:" + _faults.SensorOutOfPhase);
      }
    }
  }



Confirm sensor velocity is in phase with motor output using any of the methods documented above.

Below is an example screenshot of a successfully phased sensor and motor output.  Both are negative (good).

.. image:: img/sensor-13.png

Below is an example screenshot of a successfully phased sensor and motor output.  Both are negative (in green).  

.. image:: img/sensor-14.png

.. note:: The natural sensor measurement (purple) under Quad is opposite of the Selected sensor value.  This is proof-positive that setSensorPhase(true) was used to adjust the sensor phase to better match the motor voltage direction.

What if the sensor Phase is already correct?
............................................
The recommendation is to always call setSensorPhase routine/VI.  If the phase is naturally correct, then pass false.  The reasons to do this are:

- During competition, you may find the pit-crew / repair-team wired a replacement motor/harness incorrectly and must resolve this with a “quick software fix”.  
- During competition, you may find the pit-crew / repair-team wired a replacement sensor/harness incorrectly and must resolve this with a “quick software fix”.
- This provides the means of changing the sensor phase to the “wrong value” during hardware-bring up, so you can demonstrate to other team members what an out of phase sensor looks like in your telemetry.





Confirm Sensor Resolution/Velocity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
After correcting the sensor phase, the next step is to confirm sensor resolution matches your expectations.  This is an important step in sensor validation. 

Listed below are the typical sensor resolutions for common sensors.  Lookup your sensor type and note the expected resolution.  Call this kSensorUnitsPerRotation.

Sensor Resolution
------------------------------------------------------

Sensor Type	Units per rotation
Quadrature Encoder : US Digital 1024 CPR	4096 (because Talon SRX / CANifer counts every edge)
CTRE Magnetic Encoder (relative/quadrature)	4096
CTRE Magnetic Encoder (absolute/pulse width encoded)	4096 (0 to 4095 if wrap around not tracked)
Any pulse width encoded position	4096 represents 100% duty cycle
AndyMark CIMcoder	80 (because 20 pulses => 80 edges)
Analog	1024 (0 to 1023 if wrap around not tracked)


.. note:: Sensor are typically reported in the raw sensor units to ensure all of the available sensor resolution is utilized.  However starting in 2020 season, there likely will be scaling options to universally adjust how sensor position is interpreted (for example, in fractional rotations).







Lookup the kMaxRPM of your motor.  This will be advertised as the free-speed or max-velocity of your motor.

Determine if your mechanism has a gear-ratio between the motor and your sensor.  Typically this is a reduction, meaning that there are several motor rotations per single sensor rotation.  Call this kGearRatio.

Calculate the expect peak sensor velocity (sensor units per 100ms) as:

.. code-block:: html

  (kMaxRPM  / 600) * (kSensorUnitsPerRotation / kGearRatio)



Knowing the maximum possible sensor velocity, compare this against the sensor velocity report in any of the following:

- self-test under selected sensor (PID0).
- getSelectedSensorVelocity() API
- Tuner plotter sensor velocity

You will likely find your ideal value is greater than your measured value due to load.  In the case of testing a drive train, it is recommend to place robot on a tote/crate so that wheels can spin free.

If your mechanism does not allow for full motor output due to its design, choose a slower duty cycle and scale by the expected velocity.



Setting Sensor Position
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Depending on the sensor selected, the user can modify the “Sensor Position”.  This is particularly useful when using a Quadrature Encoder (or any relative sensor) which needs to be “zeroed” or “home-ed” when the robot is in a known position.


Auto Clear Position using Index Pin Or Limit Switches
------------------------------------------------------

In addition to manually changing the sensor position, the Talon SRX supports automatically resetting the Selected Sensor Position to zero whenever a digital edge is detected.

This can be activated via config API or config tab in Tuner.

Clear Pos event can be triggered by:

- Falling edge on Forward Limit (pin 4)
- Falling edge on Reverse Limit (pin 8)
- Rising edge on Quadrature Index (pin 9)

.. image:: img/sensor-20.png

Self-test can also be used to confirm the enabling of auto zero features.

.. image:: img/sensor-21.png





Velocity Measurement Filter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The Talon SRX measures the velocity of all supported sensor types as well as the current position.  Every 1ms a velocity sample is measured and inserted into a rolling average.  

The velocity sample is measured as the change in position at the time-of-sample versus the position sampled 100ms-prior-to-time-of-sample.  The rolling average is sized for 64 samples.
Though these settings can be modified, the (100ms, 64 samples) parameters are default.

Changing Velocity Measurement Parameters.
------------------------------------------------------
The two configs for the Talon Velocity Measurement are:

• Sample Period (Default 100ms)
• Rolling Average Window Size (Default 64 samples).

Each can be modified through programming API, and through Tuner.

.. note:: When the sample period is reduced, the units of the native velocity measurement is still change-in-position-per-100ms.  In other words, the measurement is up-scaled to normalize the units.  Additionally, a velocity sample is always inserted every 1ms regardless of setting selection.

.. note:: The Velocity Measurement Sample Period is selected from a fixed list of pre-supported sampling periods [1, 5, 10, 20, 25, 50, 100(default)] milliseconds.

.. note:: The Velocity Measurement Rolling Average Window is selected from a fixed list of pre-supported sample counts: [1, 2, 4, 8, 16, 32, 64(default)]. If an alternative value is passed into the API, the firmware will truncate to the nearest supported value.


Recommended Procedure
------------------------------------------------------

The general recommended procedure is to first set these two parameters to the minimal value of ‘1’ (Measure change in position per 1ms, and no rolling average).  Then plot the measured velocity while manually driving the Talon SRX(s) with a joystick/gamepad.  Sweep the motor output to cover the expected range that the sensor will be expected to cover.

Unless the sensor velocity is considerably fast (hundreds of sensor units per sampling period) the measurement will be very coarse (visual stair-stepping as the motor output is increased).
Increase the sampling period until the measured velocity is sufficiently granular.

At this point the sensor velocity will have minimal stair-stepping (good) but will be quite noisy.  Increase the rolling average window until the velocity plot is sufficiently smooth, but still responsive enough to meet the timing requirements of the mechanism.


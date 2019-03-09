Bring Up: Differential Sensors
=====================================

This section is dedicated to validating any differential sensor for any CTR motor controller.
Generally using a differential sensor is necessary for:

- Close-Loop control modes (Position, MotionMagic, Velocity, MotionProfile) when the mechanism has more than one sensor attached to it
- Auxiliary Closed-Loop control modes (MotionProfileArc, and all other Closed-Loop control modes) for mechanisms that require a differential component (Such as an elevator where the two sides are not linked mechanically)

Bring up the sensors involved as remote sensors/local sensor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In order to use differential sensors, you must bring up all the sensors involved first on their local controllers, look below for this:

.. toctree::
   :maxdepth: 1

   ch07_InitHardTesting
   ch08_BringUpCAN
   ch09_BringUpPCM
   ch10_BringUpPDP
   ch11_BringUpPigeon
   ch12_BringUpCANifier
   ch13_MC
   ch14_MCSensor

And after they are brought up on their local controller they should be configured as a remote filter on the master device, see :ref:`remote-sensors-label`.

Configure sensors as Sum/Diff terms
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Once the sensors are brought up and checked, we can move on to configuring them as the sum/diff terms. 

The sum of two sensors is used mostly to calculate the overall movement of the mechanism, for example in the case of a differential lift the sum is used to calculate the height of the lift.

The difference of two sensors, however, is mostly used to calculate the differential portion of the mechanism, for example with a differential lift it's used to calculate how level the lift is.

The sum and diff terms will almost always be the same, and will almost always be a local sensor and a remote sensor, or two remote sensors.

.. code-block:: java

        /* Remote Sensor 0 is the other talon's quadrature encoder */
        remoteFilter0.remoteSensorSource = RemoteSensorSource::RemoteSensorSource_TalonSRX_SelectedSensor;
        remoteFilter0.remoteSensorDeviceID = otherTalon->GetDeviceID();

        /* Configure sensor sum to be this quad encoder and the other talon's encoder */
        sum0Term = FeedbackDevice::QuadEncoder;
        sum1Term = FeedbackDevice::RemoteSensor0;

.. image:: img/lv-sensor-term-1.png

Auxiliary PID Polarity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Auxiliary PID Polarity flag configures whether the master motor controller uses the addition of the two PID's and the auxiliary follower uses the subtraction, or if the master uses the subtraction and the auxiliary follower uses the addition.

Setting this to false will cause the master/follower pair to behave like this:
 - Master Motor Controller Output = PID[0] + PID[1]
 - Auxiliary Follower Output = PID[0] - PID[1]

Setting this to true will cause the master/follower pair to behave like this:
 - Master Motor Controller Output = PID[0] - PID[1]
 - Auxiliary Follower Output = PID[0] + PID[1]

Using the differential sensor setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This is covered in :ref:`ch16_ClosedLoop`
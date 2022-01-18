.. _ch15a_Simulation:

Simulation
===========================

Supported Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Currently, the following devices are supported in simulation:

- Talon SRX
- Talon FX
- Victor SPX
- CANCoder
- Pigeon IMU
- Pigeon 2.0

.. warning:: Multiple CAN buses using the CANivore API is not supported at this time. If you wish to run your robot code in simulation,
	ensure devices have unique IDs across CAN buses.

Simulation API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Each supported device has a SimCollection object to manage I/O with the simulation model.
The object can be retrieved by calling ``getSimCollection()`` on an instance of a device.

.. code-block:: java

	TalonFX fx = new TalonFX(0);
	TalonFXSimCollection fx_sim = fx.getSimCollection();

.. tip:: For example usage of the SimCollection API, check out our `examples <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages>`_
	that support simulation, such as our
	`differential drive simulation example <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/blob/master/Java%20General/DifferentialDrive_Simulation/src/main/java/frc/robot/Robot.java>`_.

.. note:: Simulating non-FRC applications (not using WPI\_\* classes) will require calling ``Unmanaged.feedEnable(100);`` to enable simulated actuators.

.. note:: To view simulated devices in the WPILib simulation GUI, use the WPI\_\* class extensions.

Simulating Sensors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CTRE device simulation reflects what the physical device would see in normal hardware operation. This does not always reflect the behavior
of our regular device APIs.

As an example, when ``setInverted(true)`` is called on a motor controller, the following values are all inverted in the regular device API:

- input to set()
- output of getMotorOutputPercent()
- output of getMotorOutputVoltage()
- input to setSelectedSensorPosition()
- output of getSelectedSensor\*()

However, the SimCollection I/O represents what the physical motor controller sees. For example, ``getMotorOutputLeadVoltage()`` returns
the voltage you would read across the motor output leads with a voltmeter. If the motor is inverted, the voltage measured will be inverted
from what is seen in the regular device API.

Therefore, in the SimCollection API, none of the following values will be inverted:

- output of SimCollection.getMotorOutputLeadVoltage()
- input to SimCollection.set\*Position()
- input to SimCollection.add(Quadrature/IntegratedSensor)Position()
- input to SimCollection.set\*Velocity()

It is important to take this into account to avoid unexpected behavior. For example, using the output of ``getMotorOutputVoltage()`` to
determine the input of ``SimCollection.set*Velocity()`` will result in the sensor values being inverted in the API. However, using the
output of ``SimCollection.getMotorOutputLeadVoltage()`` will result in the expected behavior.

"Raw" Quadrature/Integrated Sensor Position
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The quadrature sensor on the Talon SRX and the integrated sensor on the Talon FX have a unique problem. Users can set the position of the
sensor through the regular device API using ``setSelectedSensorPosition()`` and ``SensorCollection.set(Quadrature/IntegratedSensor)Position()``.
However, the user simulation model does not know about these calls. Our solution is to separate the encoder values seen in the regular device API
from the simulated encoder values. We call this separate simulated encoder position the "raw" position.

When the raw position of the quadrature or integrated sensor is set in the SimCollection API, the simulated device takes the difference between
the new raw position and the previous raw position. It then adds that difference to the actual sensor position reported to the user. As a result,
the user simulation model does **not** have to worry about user calls to ``setSelectedSensorPosition()``.

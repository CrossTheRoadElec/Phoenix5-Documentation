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

Simulation API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Each supported device has a SimCollection object to manage I/O with simulated devices.
The object can be retrieved by calling ``getSimCollection()`` on an instance of a device.

.. code-block:: java

	TalonFX fx = new TalonFX(0);
	TalonFXSimCollection fx_sim = fx.getSimCollection();

.. tip:: For example usage of the SimCollection API, check out our `examples <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages>`_
	that support simulation, such as our
	`differential drive simulation example <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/blob/master/Java%20General/DifferentialDrive_Simulation/src/main/java/frc/robot/Robot.java>`_.

.. note:: Simulating non-FRC applications (not using WPI\_\* classes) will require calling ``Unmanaged.feedEnable(100);`` to enable simulated actuators.



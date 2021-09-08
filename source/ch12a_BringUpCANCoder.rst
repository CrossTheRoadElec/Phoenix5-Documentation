.. _ch12a_BringUpCANCoder:

Bring Up: CANCoder
==================

Magnet Placement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Using the CANCoder User's Guide, verify that magnet placement is correct for the CANCoder.


Phoenix Tuner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Open Phoenix tuner and use the Self-test Snapshot feature to confirm values.
By default, the position value is in units of degrees.

.. image:: img/bring-12a-selftest.PNG


Choose Sensor Direction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Choose which direction of the sensor is positive using the "Sensor Direction" config setting.

.. image:: img/bring-12a-configDir.PNG

By default, positive direction is counter-clockwise rotation of the magnet when looking at the magnet side of the CANCoder.

Use the self-test snapshot to confirm the sensor value changes as expected for the chosen direction.

Choose Sensor Boot-Initialization Strategy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Select whether the CANCoder position should initialize to 0 or initialize to the absolute position measurement.

.. image:: img/bring-12a-configBoot.png

Choose Absolute Sensor Range
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Select whether the absolute position value should range from 0 degrees to 360 degrees or -180 to +180.

.. image:: img/bring-12a-configRange.PNG

Choose Absolute Sensor Offset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Choose an offset for the 0 point of the absolute measurement.

By default, this 0 point is when the magnet's north aligns with the LED on the CANCoder.  

.. image:: img/bring-12a-configOffset.PNG


.. note:: For mechanisms with a fixed range of motion, the offset should be set so that the discontinuity of the absolute measurement (ie, the rollover from 360 -> 0 or 180 -> -180) does not occur in the mechanism's range of motion.


CANCoder API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a CANCoder object in your robot project and poll the position value.

.. code-block:: java

    import com.ctre.phoenix.sensors.CANCoder;
    public class Robot extends TimedRobot {

    CANCoder _coder = new CANCoder(1);
    int _loopCount = 0;

    public void teleopPeriodic() {
            if(_loopCount++ > 10)
            {
                _loopCount = 0;
                int degrees = _coder.getPosition();
                System.out.println("CANCoder position is: " + degrees);
            }
        }


Confirm that the output matches the self-test snapshot results.

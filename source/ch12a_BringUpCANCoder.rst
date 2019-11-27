.. _ch12a_BringUpCANCoder:

Bring Up: CANCoder
==================

Magnet Placement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Using the CANCoder User's Guide, verify that magnet placement is correct for the CANCoder.


Choose Sensor Direction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Choose which direction of the sensor is positive.

By default, positive direction is counter-clockwise rotation of the magnet when looking at the magnet side of the CANCoder.

Choose Sensor Boot-Initialization Strategy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Select whether the CANCoder position should initialize to 0 or initialize to the absolute position measurement.

Choose Absolute Sensor Range
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Select whether the absolute position value should range from 0 degrees to 360 degrees or -180 to +180.

Choose Absolute Sensor Offset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Choose an offset for the 0 point of the absolute measurement.

By default, this 0 point is when the magnet's north aligns with the LED on the CANCoder.  

For mechanisms with a fixed range of motion, the offset should be set so that the discontinuity of the absolute measurement (ie, the rollover from 380 -> 0 or 180 -> -180) does not occur in the mechanism's range of motion.
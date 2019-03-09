Bring Up: CANifier
==================

Phoenix Tuner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using self-test, confirm all sensor inputs required by the robot application.

If using Limit switches, assert each switch one at time.  Self-test after each transition to confirm wiring.

If using Quadrature or Pulse width sensor, rotate sensor while performing self-test to confirm sensor values.

.. image:: img/bring-15.png

LED Strip Control
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See `CANifier user’s guide <http://www.ctr-electronics.com/downloads/pdf/CANifier%20User's%20Guide.pdf>`_ for wiring and controlling LED Strip.

CANifier API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Create a CANifier object in your robot application and poll whatever sensor you have connected to it or the bus voltage

.. code-block:: java

    import com.ctre.phoenix.CANifier;
    public class Robot extends TimedRobot {
        CANifier _canifier = new CANifier(0);
        int _loopCount = 0;

        public void teleopPeriodic() {
            if(_loopCount++ > 10)
            {
                _loopCount = 0;
                System.out.println("Bus voltage is: " + _canifier.getBusVoltage());
            }
        }

.. image:: img/canifier-lv-1.png

Confirm output matches self-test results.
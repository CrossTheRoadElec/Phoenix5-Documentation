Common Device API
=================

Setting Status Frame Periods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
All Phoenix devices have a setStatusFramePeriod() routine that allows manually adjusting the frame periods of the status signals.

CAN bus Utilization/Error metrics
------------------------------------------------------
The **driver station** provides various **CAN bus metrics** under the **lightning bolt** tab.

Utilization is the *percent of bus time that is in use* relative to the total bandwidth available of the 1Mbps Dual Wire CAN bus. 
So at 100% there is no idle bus time (no time between frames on the CAN bus).

.. tip: We recommend keeping the bus utilization below 90

Demonstrated here is **70% bus use** when controlling **16 Talon SRXs**, along with **1 Pneumatics Control Module (PCM) and the Power Distribution Panel (PDP)**.

.. image:: img/ds-can-util.png

.. note: This is using the default status frame periods.

The "Bus Off" counter increments every time the CAN Controller in the roboRIO enters “bus-off”, a state where the controller “backs off” transmitting until the CAN bus is deemed “healthy” again.

A good method for watching it increment is to short/release the CAN bus High and Low lines together to watch it enter and leave “Bus Off” (counter increments per short).
The “TX Full” counter tracks how often the buffer holding outgoing CAN frames (RIO to CAN device) drops a transmit request. This is another common symptom when the roboRIO no longer is connected to the CAN bus.

The “Receive” and “Transmit” signal is shorthand for “Receive Error Counter” and “Transmit Error Counter”. 

These signals are straight from the CAN bus, and track the error instances occurred “on the wire” during reception and transmission respectively. 
These counts should always be zero. Attempt to short the CAN bus and you can confirm that the error counts rise sharply, then decrement back down to zero when the bus is restored (remove short, reconnect daisy chain).

When starting out with the FRC control system and Talon SRXs, it is recommended to watch how these CAN metrics change when CAN bus is disconnected from the roboRIO and other CAN devices to learn what to expect when there is a harness or a termination resistor issue.
Determining hardware related vs software related issues is key to being successful when using many CAN devices.


Detecting device resets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
All Phoenix devices have a hasResetOccurred() routine that will return true if device reset has been detected since previous call.

Detecting this is useful for two reasons:

- Reapply any custom status frame periods that were set using setStatusFramePeriod().
- Telemetry / general troubleshooting (in addition to sticky fault, see tip below).

.. tip:: Motor Controllers have a sticky fault to detect if device reset during robot-enable.  This is useful for detecting breaker events.

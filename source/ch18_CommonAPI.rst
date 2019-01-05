Common Device API
=================

Setting Status Frame Periods
------------------------------------------------------
All Phoenix devices have a setStatusFramePeriod() routine that allows manually adjusting the frame periods of the status signals.


Detecting device resets
------------------------------------------------------
All Phoenix devices have a hasResetOccurred() routine that will return true if device reset has been detected since previous call.

Detecting this is useful for two reasons:
- Reapply any custom status frame periods that were set using setStatusFramePeriod().
- Telemetry / general troubleshooting (in addition to sticky fault, see tip below).

.. tip:: Motor Controllers have a sticky fault to detect if device reset during robot-enable.  This is useful for detecting breaker events.

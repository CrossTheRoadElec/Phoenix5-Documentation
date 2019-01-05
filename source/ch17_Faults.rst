Faults
======

Faults are stored in two fashions.  There are “live” faults that are reported in real-time, and “sticky” faults which assert persistently and stay asserted until they are manually cleared (like trouble codes in a vehicle).

.. note:: Sticky Faults can be cleared in Tuner and via API.

.. note:: Faults and Sticky Faults can be polled using Tuner-Self-Test or via API.

.. tip:: Motor Controllers have a sticky fault to detect if device reset during robot-enable.  This is useful for detecting breaker events.

LabVIEW
-------------------
The GET STATUS VI can be used to retrieve sticky flags, and clear them.

.. image:: img/lv-faults.png

C++/Java
-------------------
The APIs getFaults() and getStickyFaults() can be used to check the latest received faults.  
clearStickyFaults() can be used to clear all sticky fault flags.

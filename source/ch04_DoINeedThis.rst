Do I need to install any of this?
=================================
Yes, if any of the following:

- You need library support for:
    - `CANifier`_
    - `Pigeon IMU`_
    - `Talon SRX`_
    - `Victor SPX`_
  
- You need to field upgrade `PCM`_, `PDP`_, or any of the above devices
- You want to use Phoenix Tuner for CAN diagnostics (highly recommended)

.. note:: `PCM`_ and `PDP`_ objects are already supported in the base FRC installation. However, Phoenix Tuner is required for setting the device ID, field-upgrade, and Self-test Snapshot.

.. important:: Newer devices are supported through the `Phoenix 6 library <https://v6.docs.ctr-electronics.com/en/stable/index.html>`__.

.. _CANifier: https://store.ctr-electronics.com/canifier
.. _Pigeon IMU: https://store.ctr-electronics.com/gadgeteer-pigeon-imu/
.. _Talon SRX: https://store.ctr-electronics.com/talon-srx/
.. _Victor SPX: https://store.ctr-electronics.com/victor-spx/

.. _PDP: https://store.ctr-electronics.com/power-distribution-panel/
.. _PCM: https://store.ctr-electronics.com/pneumatic-control-module/

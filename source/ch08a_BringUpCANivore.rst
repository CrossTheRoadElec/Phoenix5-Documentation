.. _ch08a_BringUpCANivore:

Bring Up: CANivore 
==================

View attached CANivores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Open Phoenix Tuner, go to the CANivores tab, and click on the Refresh CANivores button to get a list of CANivores
attached to the target system. You can specify the target system in the Robot Controller Install tab.

.. image:: img/bring-8a-list.png

.. note:: The Phoenix Diagnostic Server must be running on the target system to use the CANivores page.

.. tip:: If you are connecting to CANivores on your local Windows machine, there is a CANivore-usb option in the Diagnostic Server Address dropdown.
	This option runs a diagnostic server within Tuner so you do not need to run a robot project to communicate with CANivores.
	|_Windows_CANivore_USB_Image_|

.. |_Windows_CANivore_USB_Image_| image:: img/bring-8a-win-canivore-usb.png

Field upgrade CANivores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In the CANivores tab of Phoenix Tuner, select the CANivore you wish to update.
Select the CRF under the Field-upgrade section then press Update Device.
The CRFs are available in multiple places, and likely are already on your PC. See section “Device Firmware Files (crf)”.

If you wish to update all attached CANivores, check Update all CANivores. If a CANivore field-upgrade fails, then the operation will complete.
Confirm Firmware Version column in the device list after field-upgrade.

.. image:: img/bring-8a-field-upgrade.png

Rename CANivores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CANivores can be given custom names for use within a robot program.
Select the CANivore you wish to rename. Under the General CANivore Configuration section, set the new name and click "Change Name".

.. note:: CANivore names cannot be longer than 32 characters.

.. note:: To re-default the custom name, clear the “Name” text entry so it is blank and press “Change Name”.

.. image:: img/bring-8a-name.png

CANivore API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In the constructors for CANivore-compatible CAN devices, there is an optional string parameter to set the device's CAN bus.
This string can be either the name of the CANivore or the CANivore's serial number.

.. note:: On the roboRIO, if no CAN bus string is passed into the constructor, or the CAN bus string is empty, the device will use the roboRIO native CAN bus.
	Otherwise, the device will use the first CANivore found.

.. note:: You can explicitly specify that a device should use the roboRIO native CAN bus by passing down "rio" or "roborio".

.. code-block:: java

	TalonFX fx_default = new TalonFX(0);
	TalonFX fx_rio = new TalonFX(1, "rio");
	TalonFX fx_drivebase = new TalonFX(0, "Drivebase");
	CANCoder cc_elevator = new CANCoder(0, "Elevator");

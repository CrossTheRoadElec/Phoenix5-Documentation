.. _ch08a_BringUpCANivore:

Bring Up: CANivore 
==================

View attached CANivores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Open Phoenix Tuner and go to the CANivores tab, and click on the Refresh CANivores button to
get a list of attached CANivores.

.. image:: img/bring-8a-list.png

.. note:: The Phoenix Diagnostic Server must be running on the target system to use the CANivores page.

.. tip:: If you are connecting to CANivores on Windows, there is a CANivore-usb option in the Diagnostic Server Address dropdown.
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

Errata
======

HERO firmware compatibility with firmware 4.X
--------------------------------------------------------
The HERO robot controller still requires 10.X firmware in the motor controllers to function correctly.
This will addressed in a future release (which updates HERO).

Phoenix Tuner is odd at higher display resolution/DPI
--------------------------------------------------------
Opening Tuner on a monitor that has a *high* dpi setting (where Windows recommends 250%) can cause the form to not render correctly.
We recommend using a monitor resolution near 1920 X 1080 until issue is resolved.

Phoenix Tuner specifying team number may work inconsistently
----------------------------------------------------------------------
Tuner will connect via hostname/IP or via team number.  
When specifying team number, the roborio-TEAM-FRC.local host name is used correctly, however mDNS does not appear to reliably resolve.

A tentative fix has been tested where Tuner will manually resolve it, working around this limitation.
This improvement will be incorporated in a future update.

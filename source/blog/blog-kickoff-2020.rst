.. post:: Jan 4, 2020

BLOG: FRC 2020 Kickoff
======================

Hello FRC Community!

We've just release our 2020 version of Phoenix API.
The Phoenix installer and non-Windows binary kit is `now available <http://www.ctr-electronics.com/control-system/hro.html#product_tabs_technical_resources>`_.

You can also find the latest firmware CRFs at each product page (the installer also installs them).

The new features included in this season's release are listed below.

New Product - Talon FX
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The biggest addition to the Phoenix software library is support for the new brushless integrated motor/motor-controller: The Talon FX (Falcon 500).
Although this is a new product featuring several unique features, we developed the product in a way where the TalonSRX class can still be used to control the device.  We believe this will allow teams to quickly integrate the new motor controller into their robots.

Additionally a new class called TalonFX has been added to the project.  The API is very similar to the Talon SRX with the following differences:

- TalonFX's integrated sensor has a native resolution of 2048 units per rotation regardless of which class is used.
- TalonFX's default sensor type defaults to the integrated sensor (not quadrature).
- TalonFX additionally supports TalonFXFeedbackDevice, to self-document the sensor types which are supported.
- TalonFX additionally supports TalonFXControlMode (allowing future Talon FX specific control modes).
- TalonFX allows simultaneous limiting of both stator (output) and supply (input) current.

New Product - CANCoder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The other major addition to our supported product list is CANCoder.
The CANCoder is the next iteration of the popular CTRE Magnetic Encoder.
Many aspects of the software was driven based on what we've learned in supporting the Mag Encoder.

Software features include:

- The ability to choose how the Absolute Position is interpreted (±180 deg vs 360 deg).
- The ability to manually offset the magnet position.  This allows you to move inconvenient discontinuities outside of your mechanism's operational range.
- Simultaneous reporting of both the "relative" position and the "absolute position".  This means you can treat CANCoder as a relative sensor, then sync it again to become absolute.
- Basic Phoenix Tuner features (device discovery, field-upgrade,id assignment, id conflict resolving, configs, etc.)
- Customizable units string, coefficient, and time base (per second, per min) that work across Tuner and API.
- Timestamped signal updates.
- Support in all three FRC languages.

NI RoboRIO CAN Bus improvements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some of you may have heard of the low level modifications done to the roboRIO CAN Bus software for 2020.  This was to address some of the performance concerns brought on by teams in the previous season.  For those not familiar, feel free to reference this `blog entry <https://phoenix-documentation.readthedocs.io/en/latest/blog/blog-perf.html>`_ discussing the performance limitations of the roboRIO when it comes to CAN bus.

Fortunately our friends at National Instruments have found a method to allow for faster calls to the CAN bus, allowing more CAN bus calls without slowing down your roboRIO loops.
Even better, this was done in a way that doesn't require fundamental changes to the higher level software leveraging CAN bus.

This means that this performance boost plus the buffering features of Phoenix allows for the best call performance for supported CAN bus peripherals to date.

However, as a result of these changes, the initial setup for Phoenix Tuner does change a bit.  This is covered in detail below.

Phoenix Tuner 2020
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the past, users typically "install" our diagnostics software into the roboRIO in order to leverage Tuner features.  As a result of the CAN changes, the diagnostic features have been moved into a library that is linked against the robot application.  This means your Phoenix diagnostics will update any time you update the API. 

However Tuner is typically used during hardware bring-up, long before any software is written.  As such, Tuner is now capable of deploying a simple FRC application that will allow for Tuner use.
Then once you've started deploying your own applications, Tuner will use the Phoenix libraries in your application to fulfill the same needs.

It's a bit different than the previously season's workflow, but we believe it will be worth the performance gains.


Online API Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~
The online API documentation has not been updated yet, but it will be soon.  Java teams should note that the documentation-jar is already installed locally after running our installer.

Back-breaking API changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~
* No back-breaking changes have been logged.

Good luck this build season!
- Omar Zrien

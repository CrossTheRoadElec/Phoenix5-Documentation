.. _ch12b_BringUpCANdle:

Bring Up: CANdle
==================

For wiring see the CANdle Hardware User Manual on the product page:  

https://store.ctr-electronics.com/candle/

By default CANdle is configured to use GRB addressable LED strips.  Use Phoenix Tuner to change the LED Strip Type config to match the physical LED strip being used.

.. note:: 
    CANdle's latest features require using `this development build of Phoenix <https://maven.ctr-electronics.com/development/com/ctre/phoenix/frcjson/5.21.1-24-g046ee8a/frcjson-5.21.1-24-g046ee8a.json>`_ (via the `online install <https://docs.ctre-phoenix.com/en/stable/ch05a_CppJava.html#frc-c-java-add-phoenix>`_ method) along with `latest CANdle firmware (21.1.1.0) <https://github.com/CrossTheRoadElec/Phoenix-Releases/tree/master/ctr-device-firmware>`_.  
    
    The development release is a small feature-improvement release based on the latest public full release - while it hasn't gone through the entire rigorous test process for a full release the specific changes are minor and well-tested so it's safe to use on your robot. 
    
    The dev release enables use of the multi-animation CANdle features without waiting for the next full release.

CANdle API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CANdle's API calls can be found here:  
`C++ <https://store.ctr-electronics.com/content/api/cpp/html/classctre_1_1phoenix_1_1led_1_1_c_a_ndle.html>`_ | `Java <https://store.ctr-electronics.com/content/api/java/html/classcom_1_1ctre_1_1phoenix_1_1led_1_1_c_a_ndle.html>`_


Examples
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
There is a basic example for using CAndle here:  
`C++ <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/tree/master/C%2B%2B%20General/CANdle>`_ | `Java <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/tree/master/Java%20General/CANdle>`_

An advanced example using multiple animations can be found here:  
`Java <https://github.com/CrossTheRoadElec/Phoenix-Examples-Languages/tree/master/Java%20General/CANdle%20MultiAnimation>`_

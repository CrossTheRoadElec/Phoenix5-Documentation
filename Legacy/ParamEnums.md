# Parameter Enumerations

:x: **Under Ordinal Use or Sub Value Use means not Used**

| Param Enum   | Param Value | Ordinal Use | Sub Value Use | Default Value | Description Set|Description Get|
|-------------|:-------:|:-----:|:-----:|:------:|:-------------:|:---------|
|eQuadFilterEn|91|:x:|:x:|N/A|Not Supported|Not Supported|
|eClearPositionOnIdx|100|:x:|:x:|N/A|Deprecated by *eClearPositionOnQuadIdx*|Deprecated by *eClearPositionOnQuadIdx*|
|eMotionProfileHasUnderrunErr|119|:x:|:x:|N/A|Clears Has Underrun Errors|Gets if underrun|
|eMotionProfileTrajectoryPointDurationMs|120|:x:|:x:|0|Configures Motion Profile Trajectory Period|Gets Motion Profile Trajectory Period|
|eClearPosOnLimitF|144|:x:|:x:|0|Deprecated by *eClearPositionOnLimitF*|Deprecated by *eClearPositionOnLimitF*|
|eClearPosOnLimitR|145|:x:|:x:|0|Deprecated by *eClearPositionOnLimitR*|Deprecated by *eClearPositionOnLimitR*|
|eStatusFramePeriod|300|:x:|Frame Period|[In ReadMe](https://github.com/CrossTheRoadElec/Phoenix-Documentation#status-frames--how-to-tweak-them)|Sets the frame period of the specified frame|Gets the frame period of the specified frame|
|eOpenloopRamp|301|:x:|:x:|0|Configures the open loop ramp rate|Gets the open loop ramp rate|
|eClosedloopRamp|302|:x:|:x:|0|Configures the closed loop ramp rate|Gets the closed loop ramp rate|
|eNeutralDeadband|303|:x:|:x:|**0.04**|Configures the neutral deadband of the Motor Controller|Gets the neutral deadband of the motor controller|
|ePeakPosOutput|305|:x:|:x:|**1**|Configures the peak positive output of the motor controller|Gets the peak positive output of the motor controller|
|eNominalPosOutput|306|:x:|:x:|0|Configures the nominal positive output of the motor controller|Gets the nominal positive output of the motor controller|
|ePeakNegOutput|307|:x:|:x:|**-1**|Configures the peak negative output of the motor controller|Gets the peak negative output of the motor controller|
|eNominalNegOutput|308|:x:|:x:|0|Configures the nominal negative output of the motor controller| Gets the nominal negative output of the motor controller|
|eProfileParamSlot_P|310|Slot Select [0,3]|:x:|0|Configures the P gain at the specified slot|Gets the P gain at the specified slot|
|eProfileParamSlot_I|311|Slot Select [0,3]|:x:|0|Configures the I gain at the specified slot| Gets the I gain at the specified slot|
|eProfileParamSlot_D|312|Slot Select [0,3]|:x:|0|Configures the D gain at the specified slot|Gets the D gain at the specified slot|
|eProfileParamSlot_F|313|Slot Select [0,3]|:x:|0|Configures the F gain at the specified slot|Gets the F gain at the specified slot|
|eProfileParamSlot_IZone|314|Slot Select [0,3]|:x:|0|Configures the I Zone at the specified slot| Gets the I Zone at the specified slot|
|eProfileParamSlot_AllowableErr|315|Slot Select [0,3]|:x:|0|Configures the allowable error at the specified slot|Gets the allowable error at the specified slot|
|eProfileParamSlot_MaxIAccum|316|Slot Select [0,3]|:x:|0|Configures the max I accum at the specified slot|Gets the max I Accum at the specified slot|
|eProfileParamSlot_PeakOutput|317|Slot Select [0,3]|:x:|0|Configures the peak output at the specified slot|Gets the peak output at the specified slot|
|eClearPositionOnLimitF|320|:x:|:x:|0|Configures zeroing the sensor on limit forward|Gets whether the sensor will zero on limit forward|
|eClearPositionOnLimitR|321|:x:|:x:|0|Configures zeroing the sensor on limit reverse|Gets whether the sensor will zero on limit reverse|
|eClearPositionOnQuadId|322|:x:|:x:|0|Configures zeroing the sensor on index|Gets whether the sensor will zero on index|
|eSampleVelocityPeriod|325|:x:|:x:|**100**|Configures the velocity sampling period of the selected sensor|Gets the velocity sampling period of the selected sensor|
|eSampleVelocityWindow|326|:x:|:x:|**64**|Configures the velocity measurement window of the selected sensor|Gets the velocity measurement window of the selected sensor|
|eFeedbackSensorType|330|PID Index [0,1]|:x:|0|Configures the selected feedback device type|Gets the selected feedback device type|
|eSelectedSensorPosition|331|PID Index [0,1]|:x:|0|Sets the selected feedback device's position|Gets the selected feedback device's position|
|eFeedbackNotContinuous|332|PID Index [0,1]|:x:|0|Configures sensor wrap|Gets whether the talon will allow sensor wrap|
|eRemoteSensorSource|333|Remote Source [0,1]|:x:|0|Configures type of remote sensor at selected source index|Gets type of remote sensor at selected source index|
|eRemoteSensorDeviceID|334|Remote Source [0,1]|:x:|0|Configures ID of remote sensor at selected source index|Gets ID of remote sensor at selected source index|
|eSensorTerm|335|Sensor Term [0,3]|:x:|0|Configures the selected sensor term to use the selected feedback device|Gets the feedback device from the selected sensor term|
|eRemoteSensorClosed LoopDisableNeutralOnLOS|336|:x:|:x:|0|Configures motor controller disable on Remote Sensor Loss Of SIgnal(LOS)|Gets motor controller disable on Remote Sensor Loss Of Signal(LOS)|
|ePIDLoopPolarity|337|**1**|:x:|0|Configures polarity of auxiliary PID loop|Gets Polarity of Auxiliary PID Loop|
|ePIDLoopPeriod|338|Slot Index [0,3]|:x:|0|Configures PID Loop Period of selected slot|Gets PID Loop period of selected slot|
|eSelectedSensorCoefficient|339|PID Index [0,1]|:x:|**1**|Configures the position and velocity coefficient of the selected sensor|Gets the position and velocity coefficient of the selected sensor|
|eForwardSoftLimitThreshold|340|:x:|:x:|0|Configures the forward soft limit|Gets the forward soft limit|
|eReverseSoftLimitThreshold|341|:x:|:x:|0|Configures the reverse soft limit|Gets the reverse soft limit|
|eForwardSoftLimitEnable|342|:x:|:x:|0|Configures forward soft limit enable|Gets forward soft limit enable|
|eReverseSoftLimitEnable|343|:x:|:x:|0|Configures reverse soft limit enable|Gets reverse soft limit enable|
|eNominalBatteryVoltage|350|:x:|:x:|0|Configures nominal battery voltage for voltage compensation|Gets nominal battery voltage for voltage compensation|
|eBatteryVoltageFilterSize|351|:x:|:x:|**32**|Configures the filter size for measuring battery voltage|Gets filter size for measuring battery voltage|
|eContinuousCurrentLimitAmps|360|:x:|:x:|0|Configures the maximum continous current the motor controller will allow|Gets the maximum continous current the motor controller will allow|
|ePeakCurrentLimitMs|361|:x:|:x:|Invalid [See Errata](https://github.com/CrossTheRoadElec/Phoenix-Documentation/blob/master/README.md#motor-output-direction-is-incorrect-or-accelerates-when-current-limit-is-enabled) |Configures the duration the motor controller will allow a current above the peak current|Gets the duration the motor controller will allow a current above the peak current|
|ePeakCurrentLimitAmps|362|:x:|:x:|0|Configures the peak current the motor controller will allow|Gets the peak current the motor controller will allow|
|eClosedLoopIAccum|370|PID Slot [0,1]|:x:|0|Sets the I accum of the specified PID index|Gets the I accum of the specified PID index|
|eCustomParam|380|:x:|:x:|0|Not used currently|Not used currently|
|eStickyFaults|390|:x:|:x:|0|Clears sticky faults|Not used|
|eAnalogPosition|400|:x:|:x:|0|Sets Analong Position|Gets Analog Position|
|eQuadraturePosition|401|:x:|:x:|0|Sets Quadrature Position|Gets Quadrature Position|
|ePulseWidthPosition|402|:x:|:x:|0|Sets Pulse-Width Decoded Position|Gets Pulse-Width Decoded Position|
|eMotMag_Accel|410|:x:|:x:|0|Configures Motion Magic Acceleration|Gets Motion Magic Acceleration|
|eMotMag_VelCruise|411|:x:|:x:|0|Configure Motion Magic Cruise Velocity|Gets Motion Magic Cruise Velocity|
|eLimitSwitchSource|421|Forward or Reverse [0,1]|:x:|0|Configures the source for a limit switch|Gets the source for the limit switch|
|eLimitSwitchNormClosedAndDis|422|Forward or Reverse [0,1]|:x:|0|Configures the limit switch to be normally open or normally closed or disabled|Gets the limit switch configurationf or normally open or normally closed or disabled|
|eLimitSwitchDisableNeutralOnLOS|423|:x:|:x:|0|Configures motor controller disable on Remote Limit Switch Loss Of SIgnal(LOS)|Gets motor controller disable on Remote Limit Switch Loss Of SIgnal(LOS)|
|eLimitSwitchRemoteDevID|424|Remote Source [0,1]|:x:|0|Configures Device ID for Remote Limit Switch Source|Gets Device ID for Remote Limit Switch source|
|eSoftLimitDisableNeutralOnLOS|425|:x:|:x:|0|Configures motor controller disable on Remote Soft Limit Loss Of Signal(LOS)|Gets motor controller disable on Remote Soft Limit Loss Of Signal(LOS)|
|ePulseWidthPeriod_EdgesPerRot|430|:x:|:x:|**1**|Configures the number of edges of a PWM signal for one rotation|Gets the number of edges of a PWM signal for one rotation|
|ePulseWidthPeriod_FilterWindowSz|431|:x:|:x:|**1**|Configures the window size of a PWM signal|Gets the window size of a PWM signal|
|eAdvancedForceVelDiv4|440|:x:|:x:|0|Configures the velocity to be divided by 4 at all times|Gets whether the velocity is divided by 4 at all times|
|eYawOffset|160|:x:|Tare Type|0|Sets the Yaw of the Pigeon based on TareType|Not Used|
|eCompassOffset|161|:x:|:x:|0|Not Used|Not Used|
|eBetaGain |162|:x:|:x:|0|Not Used|Not Used|
|eEnableCompassFusion|163|:x:|:x:|0|Configures fusing the compass with the gyroscope|Gets whether the compass is fusing with the gyroscope|
|eGyroNoMotionCal|164|:x:|:x:|0|Configures calibrating the gyro when not moving|Gets whether the gyro is calibrating when it's not moving|
|eEnterCalibration|165|:x:|:x:|0|Puts Pigeon in specified calibration mode|Gets what calibration mode the pigeon is in, if it's in one|
|eFusedHeadingOffset|166|:x:|Tare Type|0|Sets the fused heading of the pigeon based on tare type|Not Used|
|eStatusFrameRate|169|:x:|Frame Period|[In ReadMe](https://github.com/CrossTheRoadElec/Phoenix-Documentation#status-frames--how-to-tweak-them)|Sets the frame period of the specified frame|Gets the frame period of the specified frame|
|eAccumZ|170|:x:|Tare Type|0|Sets the accumulated Z value|Not Used|
|eTempCompDisable|171|:x:|:x:|0|Configures using the temperature calibration|Gets whether the temperature calibration is being used|
|eMotionMeas_tap_threshX|172|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_tap_threshY|173|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_tap_threshZ|174|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_tap_count|175|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_tap_time|176|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_tap_time_multi|177|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_shake_reject_thresh|178|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_shake_reject_time|179|:x:|:x:|0|Not implemented|Not implemented|
|eMotionMeas_shake_reject_timeout|180|:x:|:x:|0|Not implemented|Not implemented|

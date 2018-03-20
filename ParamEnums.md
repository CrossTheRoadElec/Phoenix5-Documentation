# List of Param Enums and what they're used for

:x: **Under Ordinal Use or Sub Value Use means not Used**

| Param Enum   | Param Value | Ordinal Use | Sub Value Use | Default Value | Description Set|Description Get|
|-------------|:-------:|:-----:|:-----:|:------:|:-------------:|:---------|
|eOnBoot_BrakeMode|31|:x:|:x:|N/A|Not Used|Not Used|
|eQuadFilterEn|91|:x:|:x:|N/A|Not Used|Not Used|
|eQuadIdxPolarity|108|:x:|:x:|N/A|Not Used|Not Used|
|eClearPositionOnIdx|100|:x:|:x:|0|When Index Pin is closed, zero the sensor|Get whether sensor will zero on index pin close|
|eMotionProfileHasUnderrunErr|119|:x:|:x:|N/A|Clears Has Underrun Errors|Gets if underrun|
|eMotionProfileTrajectoryPointDurationMs|120|:x:|:x:|0|Sets Motion Profile Trajectory Period|Gets Motion Profile Trajectory Period|
|eClearPosOnLimitF|144|:x:|:x:|0|Deprecated by *eClearPositionOnLimitF*|Deprecated by *eClearPositionOnLimitF*|
|eClearPosOnLimitR|145|:x:|:x:|0|Deprecated by *eClearPositionOnLimitR*|Deprecated by *eClearPositionOnLimitR*|
|eStatusFramePeriod|300|:x:|Frame Period|[In ReadMe](https://github.com/CrossTheRoadElec/Phoenix-Documentation#status-frames--how-to-tweak-them)|Sets the frame period of the specified frame|Gets the frame period of the specified frame|
|eOpenloopRamp|301|:x:|:x:|0|Sets the open loop ramp rate|Gets the open loop ramp rate|
|eClosedloopRamp|302|:x:|:x:|0|Sets the closed loop ramp rate|Gets the closed loop ramp rate|

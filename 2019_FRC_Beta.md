# Phoenix Installation Instructions - FRC BETA 2019 (C++/Java)

## 1) Install Phoenix on your PC
### Windows
For Windows, run the latest Windows EXE found on TeamForge.  
This will look very similar to previous installers - make sure you have the relevent component selected for your programming language.

![](images/Phoenix-installerSplash.png)


### Linux
For Linux users, unzip the Linux zip found on TeamForge into USERHOME\frc2019.

## 2) Open Your Robot Program in VsCode
Either create or open an existing robot project in vscode.  Follow the WPI Screensteps instructions on how to do this.

## 3) Add Phoenix to Your Robot Project
This has a couple steps to it:
### A) Right-Click on "build.gradle" in the project tree, then select "Manage Vendor Libraries".
![](images/vscode-manage-vendor-libraries.png)

### B) At the top of your screen, a menu will appear.  Select "Install new libraries (offline)".
![](images/vscode-install-new-libraries-offline.png)

### C) The menu will now display a list of vendor libraries you can install.  Check "CTRE Phoenix", then click "OK"
![](images/vscode-check-ctre-phoenix-ok.png)

## You will now be able to use CTRE Phoenix libraries in your robot project!

------------------------------------
# Phoenix Installation Instructions - FRC BETA 2019 (LabVIEW)
## 1) Install LabVIEW per the 2019 beta instructions.

## 2) Install the Latest version of Phoenix Framework (at least v5.9.1)  
This will look very similar to previous installers - make sure you have the relevent component selected for your programming language.

![](images/Phoenix-installerSplash.png)

## 3) Use Phoenix Diagnostics Client to install the Phoenix Diagnostics Server onto the roboRIO.

### Your LabVIEW Code WILL NOT RUN if you do not do this step.
This is similar to previous years' requirement to install the web-based configuration plug-in with LifeBoat.

### a) Open Phoenix Diagnostics
### b) Connect to the roboRIO via USB
### c) Click 'Update Binaries'
![](images/diag-client-updatebinaries.png)


------------------------------------
# NEW: CTRE Phoenix Diagnostics
## This is the replacement for the CAN-plugin in the Web-Based Configuration Tool.

### More Documentation Coming Soon!
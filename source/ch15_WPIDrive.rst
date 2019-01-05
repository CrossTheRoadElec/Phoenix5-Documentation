WPI/NI Software Integration
===========================

The stock software frameworks in the FRC control system has several features used by teams.
To leverage these features, the C++ /Java Phoenix API has two additional classes:

- WPI_TalonSRX
- WPI_VictorSPX

These are wrappers for the Talon SRX and Victor SPX, that provide:

- LiveWindow support
- Motor Safety features
- Compatibility with DriveTrain classes



C++ / Java Drive Train classes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
To leverage the Drive Train classes in WPILib:
- Create your motor controller objects like normal.
- Create the Drive object like normal.
- Call setRightSideInverted(false) so that when moving forward, positive output is applied to left and right.
- Adjust setInverted() so that motors cause robot to drive straight forward when stick is forward.

.. code-block :: java

  package frc.robot;
  
  import com.ctre.phoenix.motorcontrol.can.*;
  import edu.wpi.first.wpilibj.*;
  import edu.wpi.first.wpilibj.drive.*;
  
  public class Robot extends TimedRobot {
    WPI_TalonSRX _talonL = new WPI_TalonSRX(1);
    WPI_TalonSRX _talonR = new WPI_TalonSRX(0);
    DifferentialDrive _drive = new DifferentialDrive(_talonL, _talonR);
    Joystick _joystick = new Joystick(0);
  
    @Override
    public void teleopInit() {
      /* factory default values */
      _talonL.configFactoryDefault();
      _talonR.configFactoryDefault();
  
      /* flip values so robot moves forward when stick-forward/LEDs-green */
      _talonL.setInverted(false); // <<<<<< Adjust this
      _talonR.setInverted(true); // <<<<<< Adjust this
  
      /*
       * WPI drivetrain classes defaultly assume left and right are opposite. call
       * this so we can apply + to both sides when moving forward. DO NOT CHANGE
       */
      _drive.setRightSideInverted(false);
    }
  
    @Override
    public void teleopPeriodic() {
      double xSpeed = _joystick.getRawAxis(1) * -1; // make forward stick positive
      double zRotation = _joystick.getRawAxis(2); // WPI Drivetrain uses positive=> right
  
      _drive.arcadeDrive(xSpeed, zRotation);
  
      /* hold down btn1 to print stick values */
      if (_joystick.getRawButton(1)) {
        System.out.println("xSpeed:" + xSpeed + "    zRotation:" + zRotation);
      }
    }
  }


.. tip :: It is advantageous to setup Talon / Victors in this fashion so that positive (green) represents forward motion.  This makes integrating the other control modes into your drive train simpler.

C++ / Java Motor Safety Feature
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The Java class WPI_TalonSRX and WPI_VictorSPX both implement the motor safety interface. 

The C++ class WPI_TalonSRX and WPI_VictorSPX does not inherent the motor safety abstract class, but they do implement the exact same routines.
This means the same routines can be called on the Phoenix WPI objects.



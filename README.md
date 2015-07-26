NeatoControl - control of the robot
==============

**Google Translate!**

Program management and diagnostic Neato robot vacuums.
Work on model: Neato XV series, Neato Signature, Neato Botvac.

Features are quite simple: to see the state of the sensors to change the schedule, set the time to get the image from the scanner.
(The program's interface leaves much to be desired - but there is room for improvement)

Use
-------------
Place the driver - by downloading the firmware update program (Neato Updater Tool) to [Off Site] (http://www.neatorobotics.com/support/software-update/step-one/).
Connect the robot to a computer, and then click "Connect".
Do not forget to push "disconnect" button the software before you disconnect the USB cord from the unit.

Download
-------
**[Download NeatoControl](https://bitbucket.org/heXor/neatocontrol/downloads/neatocontrol.zip)**

Bugs, ideas, suggestions
------------
Leave [here](https://bitbucket.org/heXor/neatocontrol/issues)


Screenshots
---------

[![](/_media/programs/1.png?w=90&h=65&tok=069583)](/_media/programs/1.png)
[![](/_media/programs/2.png?w=119&h=87&tok=e7d5c0)](/_media/programs/2.png)
[![](/_media/programs/3.png?w=90&h=65&tok=3d3d7a)](/_media/programs/3.png)

Known problems and their solutions
-------------------------------
If you are connected to the robot program, and then pulled out the USB cable is not clicking Disconnect.
The robot will not respond to any buttons - as is in the diagnosis of sensors and buttons (the so-called "TestMode"). Do not worry, this is normal.

Simply stop the program, connect the USB cable again, including the program, click Connect, and then Disconnect.

Denial of responsibility
------------------------
The program is provided "as is". The developer is not responsible for the use of the program (or not use).


Management
----------
Note: Be prepared to catch the robot! Before starting, make sure that the robot will not break anything and do not break the cord, do not pull off a laptop from the table, and so. In general promise to be careful (and as usual the responsibility lies with you).

If the USB cable from the connector will take off in the drive, the robot will execute the last command. For example will continue to go forward (destroying everything in its path). Just catch it and pick up in the air in seconds 5-10 team completed and it will stop.

Tab "Scanner" put a check "Manage".

Once press the button forward ** ** - robot went ahead. It will go forward until you press ** ** ago.

Pressing forward ** ** - increase speed.

** ** Left right - turns.

** ** Back - back.

All is almost obvious.

The management interface will be updated.


Commands tab
-------------

There are 6 command that can be called. Use "Run" button or simply press Enter while in the desired line, or by pressing the function key.

You can also turn on the timer to command causes periodic.

The bottom displays the result of the team.

If you check "Save ..." the results of the command are stored in the file.

Instructions of use: enter the necessary commands to assign a retry time, start recording. And after a couple of hours you will receive a data file that can be viewed carefully. =)

Translate
------------

For translation you can try this program: http://yktoo.com/en/software/dklangTraned



Changes
=========

      2.0
      Migrate to Lazarus (from Delphi)!
      "Sensors" tab - gray color for inactive sensor.
      add new localization system.

      1.10
      bug fix

      1.9
      correct charge monitoring.
      change TestMode logic - now enable only then need.
      add TCP connect - experimental! (not test)

      1.8
      add "Commands" tab.

      1.7
      add "Scan Line"
      add translation French and German (Thank glnc222)
      add WinXP theme support
      fix some bugs

      1.6
      BotVac support.
      Auto detect language.

      1.5
      Improve translate. Thanx Yuval Kohavi.

      1.4
      The buildup of the battery.
      In the telemetry readings added battery.
      Displays percentage of battery and internal time.
      You can copy to the clipboard sensor readings.

      1.3
      Now you can really control the robot!

      1.2
      Added localization mechanism through files.
      Russian version of the interface.
      Improved user interface.

      1.1
      Auto detect ports and more detailed error output connection
      Print version when connected
      Partially redesigned interface

      1.0
      first release


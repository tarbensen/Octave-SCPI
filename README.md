# Octave-SCPI
Some simple scripts for controlling instruments in GNU Octave.

## Scripts for East Tester ET5410

**batt1v2aa.m**  
**batt1v2aaa.m**  
**batt9v.m**  
It is tedious work to set up the values for a battery test. These simple scripts do all the work and ensures the same settings every time. 

You have to install the instrument-control package before using the scripts:  
_pkg install -forge instrument-control_  
The installation will take some time, maybe an hour. 

The COM-port and the serial speed should match, of course, and it is easy to edit the values for current and voltage in the scripts.



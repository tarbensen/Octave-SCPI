# Octave-SCPI
Some simple scripts for controlling instruments in GNU Octave.

You have to install the instrument-control package before using the scripts:  

```
    pkg install -forge instrument-control  
```

The installation will take some time, maybe an hour. 

## Scripts for East Tester ET5410, Electronic Load

**batt1v2aa.m**  
**batt1v2aaa.m**  
**batt9v.m**  
It is tedious work to set up the values for a battery test. These simple scripts do all the work and ensures the same settings every time. 


The COM-port and the serial speed should match, of course, and it is easy to edit the values for current and voltage in the scripts.



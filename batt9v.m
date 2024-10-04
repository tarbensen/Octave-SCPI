% batt9v.m is a GNU Octave script, that sets up East Tester ET5410 for discharging a 9 V battery.

% Adjust these variables if needed:
communication_port = "COM3";
communication_speed = 115200;
current1 = "0.050";
current2 = "0.020";
current3 = "0.010";
voltage1 = "7.500";
voltage2 = "7.100";
voltage3 = "7.000";



pkg load instrument-control;
sp = serialport(communication_port, communication_speed);
disp ("Setting ET5410 up ...");

error = 0;

writeline(sp, "CH:MODE BATT");
sv = strtrim(readline(sp));
if (!strcmp(sv, "Rexecu success"))
    error = 1;
    disp ("CH:MODE BATT error");
endif

if (error == 0)
    writeline(sp, "BATT:MODE CC");
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("BATT:MODE CC error");
    endif
endif

if (error == 0)
    writeline(sp, cstrcat("CURR:BCC1 ", current1));
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("CURR:BCC1 error");
    endif
endif

if (error == 0)
    writeline(sp, cstrcat("CURR:BCC2 ", current2));
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("CURR:BCC2 error");
    endif
endif

if (error == 0)
    writeline(sp, cstrcat("CURR:BCC3 ", current3));
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("CURR:BCC3 error");
    endif
endif

if (error == 0)
    writeline(sp, cstrcat("VOLT:BCC1 ", voltage1));
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("VOLT:BCC1 error");
    endif
endif

if (error == 0)
    writeline(sp, cstrcat("VOLT:BCC2 ", voltage2));
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("VOLT:BCC2 error");
    endif
endif

if (error == 0)
    writeline(sp, cstrcat("VOLT:BCC3 ", voltage3));
    sv = strtrim(readline(sp));
    if (!strcmp(sv, "Rexecu success"))
        error = 1;
        disp ("VOLT:BCC3 error");
    endif
endif

if (error == 0)
    disp ("Success: ET5410 is ready for discharging a 9 V battery");
endif

writeline(sp, "SYST:LOCAL");

clear error;
clear sv;
clear sp;
clear communication_port;
clear communication_speed;
clear current1;
clear current2;
clear current3;
clear voltage1;
clear voltage2;
clear voltage3;




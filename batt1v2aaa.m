% batt1v2aaa.m is a GNU Octave script, that sets up East Tester ET5410 for discharging a 1.2 V AAA battery.

% Adjust these variables if needed:
communication_port = "COM3";
communication_speed = 115200;
current1 = "0.500";
current2 = "0.150";
current3 = "0.050";
voltage1 = "1.050";
voltage2 = "1.000";
voltage3 = "0.900";



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
    disp ("Success: ET5410 is ready for discharging a 1.2 V AAA battery");
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




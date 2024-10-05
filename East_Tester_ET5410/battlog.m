% Battery discharge logger
%
% A GNU Octave script that logs the discharging of a battery
% and shows a graph of the voltage. The voltage is measured every minute.

% Adjust these variables if needed:
communication_port = "COM3";
communication_speed = 115200;



% Open serial port
pkg load instrument-control;
sp = serialport(communication_port, communication_speed);

error = 0;

% Start measurement
writeline(sp, "CH:SW ON");
sv = strtrim(readline(sp));
if (!strcmp(sv, "Rexecu success"))
    error = 1;
    disp ("CH:SW error");
endif

% Initialize figure and plot
figure;
h = plot(NaN, NaN);
xlabel('Time (min.)');
ylabel('Voltage (V)');
title('Battery voltage during discharge');
grid on;

% Log data
data = [];
error = 0;
i = -1;
writeline(sp, "CH:SW?");
running = strtrim(readline(sp));

while (error == 0 && strcmp(running, "ON"))
    writeline(sp, "MEAS:VOLT?");
    sv = strtrim(readline(sp));
    if (length(sv) < 3 || !strcmp(sv(1:2), "R "))
        error = 1;
        disp("MEAS:VOLT? error");
    else
        i = i + 1;
        data = [data; str2num(sv(3:end))];
        % Update plot
        set(h, 'XData', 0:i, 'YData', data);
        drawnow;
    endif
    pause(60);
    writeline(sp, "CH:SW?");
    running = strtrim(readline(sp));
end

writeline(sp, "SYST:LOCAL");
clear communication_port;
clear communication_speed;
clear sv;
clear sp;
clear running;
clear error;



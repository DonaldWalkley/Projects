% Claw grabbing program
s = daq.createSession('ni');
holding = false;
s.DurationInSeconds = 1;
s.Rate = 2000;
s.addAnalogInputChannel('myDAQ1','ai0', 'Voltage');
while true  
    data = startForeground(s);
    time = 1/2000*(0:length(data)-1);
    if isempty(findpeaks(data,time,'Minpeakheight',1.5,'Minpeakdistance',0.1)) && holding == true
        move_claw(4, s) % Claw Opened
        holding = false;
    end
    if isempty(findpeaks(data,time,'Minpeakheight',1.5,'Minpeakdistance',0.1)) == false && holding == false
        move_claw(9, s) % Claw Closed
        holding = true;
    end
end
s.release();
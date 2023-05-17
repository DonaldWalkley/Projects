clc;
clear all;
close all;
d = daq.getDevices;
s = daq.createSession('ni'  );
s.Rate = 2000; 
s.DurationInSeconds = 5;
s.addAnalogInputChannel('myDAQ1','ai0', 'Voltage');
t=0;
while true
    data = startForeground(s);
    time = 1/2000*(0:length(data)-1); 
    [pks,locs]=findpeaks(data,time,'Minpeakheight',1.2,'Minpeakdistance',0.1);
    diff0=1/mean(diff(locs));
    BPM=60*diff0;
fprintf('Current BPM is %0.0f \n',BPM)
subplot(2,1,1);
plot(t,BPM,'r.');
t=t+5;
ylim([0 140])
xlim([0 300]) 
hold on
xlabel('time (second)');
ylabel('BPM');
subplot(2,1,2);
plot(time,data)
xlabel('time (second)');
ylabel('Voltage');
hold off
end
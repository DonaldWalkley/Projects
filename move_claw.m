function move_claw( x, s )
    s.addAnalogOutputChannel('myDAQ1',0:1, 'Voltage');
    s.outputSingleScan([x 0]);
    pause(0.5);
    s.removeChannel(1);
    s.removeChannel(1);
    s.removeChannel(1);
    s.addAnalogInputChannel('myDAQ1','ai0', 'Voltage');
end


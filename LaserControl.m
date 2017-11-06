function LaserControl(LaserStart,LaserStop)

S = serial('com3');
fopen(S);

for ii = LaserStart:LaserStop
    set(S, 'RequestToSend', 'on');
    pause(1)
    set(S, 'RequestToSend', 'off');
    pause(3)
end

fclose(S);
delete(S)
clear S

end

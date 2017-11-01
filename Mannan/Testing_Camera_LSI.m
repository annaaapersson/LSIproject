S = serial('com4');
fopen(S)

for ii = 1:5
    set(S, 'RequestToSend', 'on');
    pause(1)
    set(S, 'RequestToSend', 'off');
    pause(3)
end

fclose(S)
delete(S)
clear S

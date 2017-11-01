function [rawImage] = cameraControl(camera)
% This function outputs an (raw) image when called upon.
%% Start image aquisition toolbox

%start(camera)
% start laser
flag = 1; % Set to 1 when camera is on
global laser
establishLaserConnection();
while flag
    set(laser, 'RequestToSend', 'on');
    pause(5)
    %rawImage = getdata(camera);
    %stop(camera)
    flag = 0;
end
% stop laser
stoplaser();
end


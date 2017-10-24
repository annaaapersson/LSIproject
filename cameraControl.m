function [rawImage] = cameraControl(camera)
% This function outputs an (raw) image when called upon.
%% Start image aquisition toolbox
start(camera)
rawImage = getdata(camera);
stop(camera)
end


function [rawImage] = cameraControl(camera)
% This function outputs an (raw) image when called upon.
%% Start image aquisition toolbox
start(camera)
%trigger(camera)
rawImage = getdata(camera);
%save('rawImage.mat', 'rawImage');
%clear image1;
stop(camera)
end


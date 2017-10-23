function [imageRaw] = cameraControl()
% This function outputs an (raw) image when called upon.
camera = videoinput('pointgrey', 1, 'F7_Mono8_2080x1552_Mode0');
src = getselectedsource(camera);

imageRaw =1; % just to test
end


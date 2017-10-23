function [] = measure()
% Measure blood perfusion
%% Take an image for ambient light corection
imageAmb = cameraControl(camera);
%% Put the laser on
set(laser, 'RequestToSend', 'on');
%% Take a raw image
imageLaserRaw = cameraControl(camera);
%% Image processing
% Input code for image processing
%% Display a processed image
processedImage = imageLaserRaw; % Just now since we don't have processedImage;
imshow(processedImage,'Border','tight','InitialMagnification', 32)
%% Turn off laser
set(laser, 'RequestToSend', 'off'); % Turn OFF laser
end


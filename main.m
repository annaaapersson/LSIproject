%% Main
close all
clear
clc
%% Establish a camera conncetion by creating a camera object named "camera"
% Both can be used, does not matter which one
[camera,src] = establishCameraConnection;
% establishCameraConnection_script;
% Establish figure in which the processed image will be displayed
figure(1)
%% Take an image for ambient light corection
imageAmb = cameraControl(camera);
%% Put the laser on
%% Take a raw image
rawImage = cameraControl(camera);
%% Image processing
% Input code for image processing
%% Display a processed image
processedImage = rawImage; % Just now since we don't have processedImage;
imshow(processedImage,'Border','tight','InitialMagnification', 32)
%% END of program - clearing memory adn such'
% stop(camera)
% Once the video input object is no longer needed, delete
% it and clear it from the workspace.
delete(camera)
clear camera
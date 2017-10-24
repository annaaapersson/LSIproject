%% Main
close all
clear
clc
%% Establish a camera conncetion by creating a camera object named "camera"
% Both can be used, does not matter which one
GUI_Settings;
%[camera,src] = establishCameraConnection;
% establishCameraConnection_script;
%% Establish laser connection
%laser = establishLaserConnection();

%% Establish figure in which the processed image will be displayed
%figure(1)
%% Measure blood perfusion:
%  should only be called upon pushing measure button.
%measure(camera);
%% END of program - clearing memory adn such'
%closeLaserConnection(laser); % CLOSE laser connection

% Once the video input object is no longer needed, delete
% it and clear it from the workspace.
%delete(camera)
%clear camera
%delete(src)
%clear src


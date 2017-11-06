function [camera,src] = establishCameraConnection()
% Establish camera connection by creating a camera object
camera = videoinput('pointgrey', 1, 'F7_Mono16_2080x1552_Mode0');
src = getselectedsource(camera);
%% Look more at these parameters etc.
% src.ExposureMode = 'Manual';
% src.Exposure = 0;
% src.GainMode = 'Manual';
% src.Gain = 20;
% src.Brightness = 0;

%% Triggering settings
triggerconfig(camera, 'immediate');
%% Settings
camera.FramesPerTrigger = 1;
%camera.FramesPerTrigger = Inf; % Shall be Inf
%src.FrameRate = 1; % Hihhest possible is 31, lowest possible 1

end


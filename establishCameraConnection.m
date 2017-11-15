function [camera,src] = establishCameraConnection()
% Establish camera connection by creating a camera object
camera = videoinput('pointgrey', 1, 'F7_Mono16_2080x1552_Mode0');
src = getselectedsource(camera);
%% Test param
%camera.ReturnedColorspace = 'rgb';
%% Look more at these parameters etc.
src.Brightness = 0;
src.ExposureMode = 'Manual';
src.Exposure = 0;
src.GainMode = 'Manual';
src.Gain = 0;
src.GammaMode = 'Manual';
src.Gamma = 1.0;
src.SharpnessMode = 'Manual';
src.Sharpness = 1220;
src.ShutterMode = 'Manual';
src.Shutter = 6;
%% Triggering settings
%triggerconfig(camera, 'immediate');
triggerconfig(camera, 'manual');
% %% Settings
camera.FramesPerTrigger = 1;
% camera.FramesPerTrigger = Inf; % Shall be Inf
% src.FrameRate = 1; % Highest possible is 31, lowest possible 1

end


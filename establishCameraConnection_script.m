%% Establish camera connection by creating a camera object
camera = videoinput('pointgrey', 1, 'F7_Mono8_2080x1552_Mode0');
src = getselectedsource(camera);

%% Triggering settings
%triggerconfig(camera, 'manual'); % Just to test
triggerconfig(camera, 'immediate');
%% Settings
camera.FramesPerTrigger = 1;
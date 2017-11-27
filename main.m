function main()
    close all
    clear all
    
        handles = struct;       % structure which stores all objects
        datas = struct;         % structure which stores all data
        
        addpath(genpath(pwd)); % Add subfolders to path

        %% Add objects
        %% Camera object
        global camera;
        camera = videoinput('pointgrey', 1, 'F7_Mono16_2080x1552_Mode0');
        global src;
        src = getselectedsource(camera);
        % Initial parameters - Look more at these parameters etc.
        src.Brightness = 0;
        src.ExposureMode = 'Manual';
        src.Exposure = 0;
        src.GainMode = 'Manual';
        src.Gain = 0; % Around 15 gave quite good result
        src.GammaMode = 'Manual';
        src.Gamma = 1.0;
        src.SharpnessMode = 'Manual';
        src.Sharpness = 1220;
        src.ShutterMode = 'Manual';
        src.Shutter = 6;
        stop(camera)
        %% Triggering settings
        %triggerconfig(handles.camera, 'immediate');
        triggerconfig(camera, 'manual');
        % %% Settings
        camera.FramesPerTrigger = 1;
        camera.TriggerRepeat = 1;
        % camera.FramesPerTrigger = Inf; % Shall be Inf
        % src.FrameRate = 1; % Highest possible is 31, lowest possible 1
        %% Laser object
        laser = laserClass;
        handles.laser = laser;
        % Add LSI image window as object
        LSIimageWindow = imageWindow;
        handles.LSIimageWindow = LSIimageWindow;
        % Listener
        LSIimageWindowListener = imageWindowListener(handles.LSIimageWindow);
        handles.LSIimageWindowListener = LSIimageWindowListener;
        
        LaserStarInc;           % calls gui function
        
end        
        
% callback functions for the GUI are stored in function files
%##########################################################################


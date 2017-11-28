function main()
    close all
    clear all
    
        handles = struct;       % structure which stores all objects
        datas = struct;         % structure which stores all data
        
        addpath(genpath(pwd)); % Add subfolders to path

        %% Add objects
        %% Camera object
        %% If using webcam
        global camera;
        camera = establishWebCamConnection;
        %% If using point grey camera
        camera = videoinput('pointgrey', 1, 'F7_Mono16_2080x1552_Mode0');
        global src;
        src = getselectedsource(camera);
        % Initial parameters - Look more at these parameters etc.
        src.Brightness = 0;
        src.ExposureMode = 'Manual';
        src.Exposure = 0; % 
        src.GainMode = 'Manual';
        src.Gain = 0; % Some [dB] scale
        src.GammaMode = 'Manual';
        src.Gamma = 1.0;
        src.SharpnessMode = 'Manual';
        src.Sharpness = 1220;
        src.ShutterMode = 'Manual';
        src.Shutter = 12; % Exposure time 12
        stop(camera)
        %% Triggering settings
        %triggerconfig(handles.camera, 'immediate');
        triggerconfig(camera, 'immediate');
        % %% Settings
        camera.FramesPerTrigger = 1;
        %camera.TriggerRepeat = 1;
        %camera.FramesPerTrigger = Inf; % Shall be Inf
        %src.FrameRate = 2; % Highest possible is 31, lowest possible 1
        %% Laser object
        handles.laser = laserClass;
        % Add LSI image window as object
        handles.LSIimageWindow = imageWindow;
        % Listener
        handles.LSIimageWindowListener = imageWindowListener(handles.LSIimageWindow);
        
        % ROI objects. Fix according to kernelSize
        handles.ROI1 = ROIClass(720/5,1280/5); % Webcam size
        handles.ROI2 = ROIClass(720/5,1280/5); % Webcam size
        % Create the plot object
        handles.plotObject = plotClass;
        
        LaserStarInc;           % calls gui function
        
end        
        
% callback functions for the GUI are stored in function files
%##########################################################################


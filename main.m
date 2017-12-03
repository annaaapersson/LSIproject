function main()
    close all
    clear all
    
        handles = struct;       % structure which stores all objects       
        
        addpath(genpath(pwd)); % Add subfolders to path
        
        folderFlag = exist('measurementImages');
        if folderFlag == 0
            mkdir measurementImages;
        end
        
        % Add objects
        %% Camera object
%         %% If using webcam
%         global camera;
%         camera = establishWebCamConnection;
        %% If using point grey camera
        global camera;
        camera = videoinput('pointgrey', 1, 'F7_Mono16_2080x1552_Mode0');
        global src;
        src = getselectedsource(camera);
        % Initial parameters - Look more at these parameters etc.
        src.Brightness = 0;
        src.ExposureMode = 'Manual';
        src.Exposure = 0;
        src.GainMode = 'Manual';
        src.Gain = 1; % Some [dB] scale
        src.GammaMode = 'Manual';
        src.Gamma = 1;
        src.SharpnessMode = 'Manual';
        src.Sharpness = 1220;
        src.ShutterMode = 'Manual';
        src.Shutter = 12; % Exposure time in milliseconds
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
%        handles.laser = laserClass;
        % Add LSI image window as object
        handles.LSIimageWindow = imageWindow;
        % Listener
        handles.LSIimageWindowListener = imageWindowListener(handles.LSIimageWindow);
        % Measurement data
        handles.measurementData = measurementClass;
        handles.database = databaseClass;
        % handles or the database
        %handles.database = databaseClass;
        % ROI objects. Fix according to kernelSize
        handles.ROI1 = ROIClass(720/5,1280/5); % Webcam size
        handles.ROI2 = ROIClass(720/5,1280/5); % Webcam size
        % Create the plot object
        handles.plotObject = plotClass;
        % Settings
        handles.previousExposureValue = 12;
        handles.Kmax = 0.1440;
        handles.Kmin = 0.0268;
        
        handles.kernelSizeSlider.Value = 3;
        handles.gainSlider.Value = 3;
        handles.exposureSlider.Value = 7;
        handles.loggedPatient = '';
        handles.loggedPatientID = '';
        handles.isLogged = 0;
        handles.ROI1Values = [];
        handles.ROI2Values = [];
        handles.timeStamp = '';
        handles.imageName1 = '';
        handles.imageName2 = '';
        handles.imageName3 = '';
%        handles.physicianName = 'Dr. Oetker';
        
        LaserStarInc;           % calls gui function
        guidata(handles.fig, handles);
end        
        
% callback functions for the GUI are stored in function files
%##########################################################################


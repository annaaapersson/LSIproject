function main()
    close all
    clear all
    
        handles = struct;       % structure which stores all objects
        datas = struct;         % structure which stores all data
        
        addpath(genpath(pwd)); % Add subfolders to path

        %% Add objects
        % Camera object
        camera = cameraClass;
        handles.camera = camera;
        % Laser object
        laser = laserClass;
        handles.laser = laser;
        % Add LSI image window as object
        LSIimageWindow = imageWindow;
        handles.LSIimageWindow = LSIimageWindow;
        % Listener
        LSIimageWindowListener = imageWindowListener(handles.LSIimageWindow);
        handles.LSIimageWindowListener = LSIimageWindowListener;
        
        LaserStarInc;           % calls gui function
        
        
        
% callback functions for the GUI are stored in function files
%##########################################################################


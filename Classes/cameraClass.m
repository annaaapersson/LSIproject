classdef cameraClass < handle % might be used
    
    properties
        theCamera
        src
    end
    
    methods
        %% If using the web cam
        % Constructor
        %          function camera = cameraClass()
        %             camera.theCamera = establishWebCamConnection();
        %         end
        %% If useing the point grey camera (OLD)
        %         function obj = cameraClass()
        %             [obj.theCamera, src] = establishCameraConnection();
        %         end
        %% If useing the point grey camera (NEW)
        % Constructor
        function obj = cameraClass()
            camera = videoinput('pointgrey', 1, 'F7_Mono16_2080x1552_Mode0');
            obj.theCamera = camera;
            src = getselectedsource(camera);
            %% Look more at these parameters etc.
            src.Brightness = 0;
            src.ExposureMode = 'Manual';
            src.Exposure = 0;
            src.GainMode = 'Manual';
            obj.src.Gain = 0; % Around 15 gave quite good result (for what filter?)
            %obj.Gain = src.Gain; % Set the obj gain to that of the camera
            
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
    end
end
        
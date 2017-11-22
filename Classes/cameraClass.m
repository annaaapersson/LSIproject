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
%% If useing the point grey camera
        function camera = cameraClass()
            [camera.theCamera, camera.src] = establishCameraConnection();
        end
    end
end
        
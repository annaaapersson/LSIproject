classdef cameraClass < handle % might be used
    
    properties
        theCamera
        src
    end
    
    methods
        % Constructor
%          function camera = cameraClass()
%             camera.theCamera = establishWebCamConnection();
%         end
        function camera = cameraClass()
            [camera.theCamera, camera.src] = establishCameraConnection();
        end
    end
end
        
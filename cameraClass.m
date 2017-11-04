classdef cameraClass % < handle % might be used
    
    properties
        cameraName
        src
    end
    
    methods
        % Constructor
        function camera = cameraClass()
            [camera.cameraName, camera.src] = establishCameraConnection();
        end
    end
end
        
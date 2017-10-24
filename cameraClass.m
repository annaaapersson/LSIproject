classdef cameraClass
    
    properties
        cameraName
        src
        % Props that we can set
        exposure
        gain
        kernelSize
    end
    
    methods
        % Constructor
        function camera = cameraClass()
            [camera.cameraName, camera.src] = establishCameraConnection();
        end
    end
end
        
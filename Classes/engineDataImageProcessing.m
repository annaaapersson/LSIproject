classdef engineDataImageProcessing < event.EventData
    % Creating an event data class for Image Processing
    properties
        kernelSize;
        camera;
        laser;
    end
    methods
        function obj = engineDataImageProcessing(kS, cam, las)
            obj.kernelSize = kS;
            obj.camera = cam;
            obj.laser = las;
        end
    end
end
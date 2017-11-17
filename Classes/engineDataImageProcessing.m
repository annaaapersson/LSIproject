classdef engineDataImageProcessing < event.EventData
    % Creating an event data class for Image Processing
    properties
        kernelSize;
        camera;
        laser;
        videoStream;
    end
    methods
        function obj = engineDataImageProcessing(kS, cam, las, videoStr)
            obj.kernelSize = kS;
            obj.camera = cam;
            obj.laser = las;
            obj.videoStream = videoStr;
        end
    end
end
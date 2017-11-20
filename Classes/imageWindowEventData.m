classdef imageWindowEventData < event.EventData
    % Creating an event data class for Image Processing
    properties
        camera;
        laser;
        videoStream;
    end
    methods
        function obj = imageWindowEventData(cam, las, videoStr)
            obj.camera = cam;
            obj.laser = las;
            obj.videoStream = videoStr;
        end
    end
end
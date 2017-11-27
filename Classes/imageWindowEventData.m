classdef imageWindowEventData < event.EventData
    % Creating an event data class for Image Processing
    properties
        handles;
    end
    methods
        function obj = imageWindowEventData(handles)
            obj.handles = handles;
        end
    end
end
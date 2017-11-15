classdef imageWindow < handle
%classdef (ConstructOnLoad) imageWindow < event.EventData
    % Class for image windows 
    properties
        State = false;
        %h = [];
    end
    events
        processImageEvent
    end
    methods
        function activate(obj, handles)
            if true ~= obj.State
                obj.State = true;
                %kernelSize_test = handles.settings.kernelSize
                %obj.h = handles
                %imageProcessing(); % want to put listener here
                kS = handles.settings.kernelSize;
                eventData = engineDataImageProcessing(kS);
                notify(obj, 'processImageEvent', eventData)
            end
        end
         function deactivate(obj)
            if false ~= obj.State
                obj.State = false;
                %notify(obj,'handleImageWindow');
            end
         end
    end
end


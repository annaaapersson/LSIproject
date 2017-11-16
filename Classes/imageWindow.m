classdef imageWindow < handle
%classdef (ConstructOnLoad) imageWindow < event.EventData
    % Class for image windows 
    properties
        State = false;
    end
    events
        processImageEvent
    end
    methods
        function activate(obj, handles)
            if true ~= obj.State
                obj.State = true;
                eventData = engineDataImageProcessing(handles.settings.kernelSize,...
                    handles.camera.theCamera, handles.laser, handles.videoStream);
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


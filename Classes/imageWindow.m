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
                eventData = imageWindowEventData(handles);
                notify(obj, 'processImageEvent', eventData)
            end
        end
         function deactivate(obj)
            if false ~= obj.State
                obj.State = false;
            end
         end
         function takeTestImage(obj, handles)
             %% If using pointgrey camera and laser:
             laser = handles.laser; % Get the laser object
             global camera; % Get the camera object
             start(camera)
             trigger(camera); % If choosing manual trigger
             imageNoLaser = getdata(camera);
             laser.start; % Turn on laser
             %start(camera); % Not needed if we have 2 triggers for
             % each start, which we currently have
             trigger(camera); % If choosing manual trigger
             imageLaser = getdata(camera);
             stop(camera); % Stop the camera
             laser.stop; % Turn off laser
             %% Image processing
             ambientLightCorrectedImage = imageLaser - imageNoLaser;
             % Get the kernel size and round data from slider
             kS = findobj('Tag', 'kernelSize');
             currentKernelSize = round(kS.Value*2-1);
             contrastImage = calculateContrast(currentKernelSize,...
                 ambientLightCorrectedImage);
             imshow(contrastImage, 'parent', handles.videoStream, 'Colormap', jet(255));
         end
    end
end


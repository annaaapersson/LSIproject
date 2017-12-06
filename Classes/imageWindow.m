classdef imageWindow < handle
    % Class for image windows 
    properties
        State = false;
        image
        activeImrect = 0
        activeCalcROI = 0
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
%              %% If using webcam
%              laser = handles.laser; % Get the laser object
%              global camera;
%              imageNoLaser = snapshot(camera);
%              % laser.start;
%              imageLaser = snapshot(camera);
%              % Stop laser
             %% If using pointgrey camera and laser:
%             laser = handles.laser; % Get the laser object
             global camera; % Get the camera object
             start(camera)
             %trigger(camera); % If choosing manual trigger
             imageNoLaser = getdata(camera);
%             laser.start; % Turn on laser
             %Start not needed if having 2 triggers for each start
             start(camera);
             %trigger(camera); % If choosing manual trigger
             imageLaser = getdata(camera);
             stop(camera); % Stop the camera
%             laser.stop; % Turn off laser
             %% Image processing
             ambientLightCorrectedImage = imageLaser - imageNoLaser;
             % Get the kernel size and round data from slider
             kS = findobj('Tag', 'kernelSize');
             currentKernelSize = round(kS.Value*2-1);
             contrastImage = calculateContrast(currentKernelSize,...
                 ambientLightCorrectedImage, handles.Kmin, handles.Kmax);
             imshow(contrastImage, 'parent', handles.videoStream, 'Colormap', jet(255),...
                     'DisplayRange',[0.5 1]);
             colorbar(handles.videoStream);
         end
    end
end


classdef imageWindowListener < handle
    methods
        function obj = imageWindowListener(imageWindow)
            addlistener(imageWindow,'processImageEvent',@imageWindowListener.handleEvnt);
        end
    end
    methods (Static)
        function handleEvnt(src,ed)
            laser = ed.handles.laser;
            videoStream = ed.handles.videoStream;
            global camera;
            while (src.State == true)
%                 %% If using webcam
%                 imageNoLaser = snapshot(camera);
%                 % Turn on laser
%                 imageLaser = snapshot(camera);
%                 % Turn off laser
                %% If using pointgrey camera and laser:
                start(camera)
                trigger(camera); % If choosing manual trigger
                imageNoLaser = getdata(camera);
                laser.start; % Turn on laser
                %start(camera); % Not needed if we have 2 triggers for
                % each start
                trigger(camera); % If choosing manual trigger
                imageLaser = getdata(camera);
                laser.stop; % Turn off laser
                %% Image processing
                ambientLightCorrectedImage = imageLaser - imageNoLaser;
                % Get the kernel size and round data from slider
                kS = findobj('Tag', 'kernelSize');
                currentKernelSize = round(kS.Value*2-1);
                contrastImage = calculateContrast(currentKernelSize,...
                    ambientLightCorrectedImage);
                imshow(contrastImage, 'parent', videoStream, 'Colormap', jet(255));
            end
            stop(camera)
            return; 
        end
    end
end

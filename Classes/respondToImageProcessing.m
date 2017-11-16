classdef respondToImageProcessing < handle 
    properties
        contrastImage;
    end
    methods
        function obj = respondToImageProcessing(imageWindow)
            addlistener(imageWindow,'processImageEvent',@respondToImageProcessing.handleEvnt);
        end
    end
    methods (Static)
        function handleEvnt(src,ed)
            kernelSize = ed.kernelSize;
            camera = ed.camera;
            laser = ed.laser;
            videoStream = ed.videoStream;
            while (src.State == true)
                %% If using webcam
                imageNoLaser = snapshot(camera);
                % Turn on laser
                imageLaser = snapshot(camera);
                % Turn off laser
                %% If using pointgrey camera and laser:
%                 start(camera)
%                 trigger(camera); % If choosing manual trigger option
%                 imageNoLaser = getdata(camera);
%                 laser.start; % Turn on laser
%                 start(camera);
%                 trigger(camera); % If choosing manual trigger option
%                 imageLaser = getdata(camera);
%                 laser.stop; % Turn off laser
                %% Image processing
                %handles.settings.kernelSize
                ambientLightCorrectedImage = imageLaser - imageNoLaser;
                %     contrastImage = calculateContrastPreMatrix(ambientLightCorrectedImage,...
                %         handles.settings.kernelSize);
                contrastImage = calculateContrast(kernelSize,...
                    ambientLightCorrectedImage);
                imshow(contrastImage, 'parent', videoStream, 'Colormap', jet(255));
                pause(0.01) % Neccessary in order to let other GUI be activated
            end
            %h = get('Name' , 'handles');
            %kernelSizeInListener = h.settings.kernelSize
            %while src.State == true
            %handlesFromGUI = guidata(hObject);
            %h = gcbo
            %kernelSizeValue = h.settings.kernelSize
            %end
        end
    end
end
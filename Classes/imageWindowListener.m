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
            ROI1 = ed.handles.ROI1;
            ROI2 = ed.handles.ROI2;
            plotObject = ed.handles.plotObject;
            roiGraph = ed.handles.roiGraph;
            %% Aquire and show contrast images
            global camera;
             start(camera)
             imageNoLaser = getdata(camera);
             laser.start; % Turn on laser
             while (src.State == true)
                %% If using webcam
%                 imageNoLaser = snapshot(camera);
%                 % Turn on laser
%                 imageLaser = snapshot(camera);
%                 % Turn off laser
                %% If using point grey camera
                start(camera); 
                imageLaser = getdata(camera);
                %% Image processing
                ambientLightCorrectedImage = imageLaser - imageNoLaser;
                % Get the kernel size and round data from slider
                kS = findobj('Tag', 'kernelSize');
                currentKernelSize = round(kS.Value*2-1);
                contrastImage = calculateContrast(currentKernelSize,...
                    ambientLightCorrectedImage, ed.handles.Kmin, ed.handles.Kmax);
                imshow(contrastImage, 'parent', videoStream, 'Colormap', jet(255),...
                     'DisplayRange',[0 2]);
                colorbar(videoStream);
                %% Select and calculate ROI
                if src.activeImrect == 1
                    displayImage = imshow(contrastImage, 'parent',...
                        videoStream, 'Colormap', jet(255),'DisplayRange',[0.5 1]);
                    colorbar(videoStream);
                    axes(videoStream);
                    e = imrect(gca,[]);
                    ROI1.matrix = createMask(e,displayImage);
                    e = imrect(gca,[]);
                    ROI2.matrix = createMask(e,displayImage);
                    src.activeImrect = 0;
                end
                if src.activeCalcROI == 1
                % Calculates mean of ROI
                value1 = calculateMeanROI(ROI1, contrastImage);
                value2 = calculateMeanROI(ROI2, contrastImage);
                % Inserts the values in ROI class
                insertValueROI1(plotObject, value1, value2);
                plotValues(plotObject, roiGraph);
                end
             end
            laser.stop; % Turn off laser
            stop(camera)
            return; 
        end
    end
end

classdef measurementClass < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        baselineImage
        minImage
        maxImage
        ROIImage
        ROI1_vector
        ROI2_vector 
    end
    
    methods
        function saveBaselineImage(obj, handles)
            %% Saves the image to file for the specified patient
            %function dedicated to take images from the
            % videoStream axes panel, housing the calculated
            % perfusion images.
            F = getframe(handles.videoStream);  %Save
            obj.baselineImage = frame2im(F);
        end
         function saveMinImage(obj, handles)
            %% Saves the image to file for the specified patient
            %function dedicated to take images from the
            % videoStream axes panel, housing the calculated
            % perfusion images.
            F = getframe(handles.videoStream);  %Save
            obj.minImage = frame2im(F);
         end
         function saveMaxImage(obj, handles)
            %% Saves the image to file for the specified patient
            %function dedicated to take images from the
            % videoStream axes panel, housing the calculated
            % perfusion images.
            F = getframe(handles.videoStream);  %Save
            obj.maxImage = frame2im(F);
         end
         
         function image =  getImageFromFile(obj, patientID, timestamp, imageType)
            % Get specific image from file
            %% Required input types
            % Input 'patientID', 'timestamp' and 'imageType' of type string
            % 'imageType' can be baseline, min, max, ROI1 and ROI2.
            addpath(genpath(pwd));
            imageFilename = getImageFilename(patientID, timestamp, imageType)
            image = imread(imageFilename);
         end
         
         function saveROIImage(obj, handles)
              %% Saves the ROIimage to file for the specified patient
              % function dedicated to take images from the
              % roiGraph panel, housing the calculated ROI-data figure
              %ROIGraph = get(handles.roiGraph); 
              %F = getframe(ROIGraph); % Save image of ROI graph
              F = getframe(handles.roiGraph); % Save image of ROI graph
              obj.ROIImage = frame2im(F);
         end
         function resetMeasurementData(obj)
             obj.baselineImage = [];
             obj.minImage = [];
             obj.maxImage = [];
             obj.ROIImage = [];
             obj.ROI1_vector = [];
             obj.ROI2_vector = [];
         end
    end
end


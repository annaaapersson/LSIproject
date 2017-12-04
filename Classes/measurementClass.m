classdef measurementClass < handle
    % Stores the measurement data and 
    % saves it to image files
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
         function saveROIImage(obj, handles)
             %% Saves the ROIimage to file for the specified patient
             % function dedicated to take images from the
             % roiGraph panel, housing the calculated ROI-data figure
             F = getframe(handles.roiGraph); % Save image of ROI graph
             obj.ROIImage = frame2im(F);
         end
    end
end


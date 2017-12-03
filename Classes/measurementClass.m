classdef measurementClass < handles
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        baselineImage
        minImage
        maxImage
        ROIImage
        ROI1Vector
        ROI2Vector
       
    end
    
    methods
        function saveBaselineImage(obj, handles)
            %% Saves the image to file for the specified patient
            %function dedicated to take images from the
            % videoStream axes panel, housing the calculated
            % perfusion images.
            F = getframe(handles.videoStream);  %Save
            obj.minImage = frame2im(F);
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
    end
end


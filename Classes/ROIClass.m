classdef ROIClass < handle
    
    properties
        activate = 0
        matrix
    end
    
    methods
        % Constructor
        function ROI = ROIClass(dimR, dimC)
            ROI.matrix = zeros(dimR, dimC);
        end
        
        function output = calculateMeanROI(object, image)
            matrixROI = object.matrix.*image;
            matrixROI(matrixROI==0) = [];
            if isempty(matrixROI)
                output = 0;
            else
            output = mean(matrixROI);
            end
        end
        
        function resetROI(obj)
            obj.activate = 0;
            obj.matrix = zeros(720/5,1280/5);
        end
    end
    
end

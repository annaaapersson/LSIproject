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
    end
end
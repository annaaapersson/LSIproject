classdef ROIClass < handle % might be used
    
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
            output = mean(matrixROI);
        end
    end
end
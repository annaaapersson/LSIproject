classdef ROIClass < handle % might be used
    
    properties
        activate = 0
        matrix
        mean
    end
    
    methods
        % Constructor
        function ROI = ROIClass(dimR, dimC)
            ROI.matrix = zeros(dimR, dimC);
            ROI.mean = 666;
        end
    end
end
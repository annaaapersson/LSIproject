classdef imageClass < handle 
    % Image class
    % Will store the contrast image as a property, which will continuously
    % be updates as a new image is obtained.
    properties
        contrastImage
    end
    
    methods
        function obj = imageClass()
            % Constructor
            obj.contrastImage = [];
        end
    end
end


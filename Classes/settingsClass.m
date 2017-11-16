classdef settingsClass < handle
    % All settings are stored in a settings class
    
    properties
        kernelSize
        %fps
    end
    
    methods
        function obj = settingsClass()
            % Constructor for settings with default parameters
            obj.kernelSize = 5;
        end
        
        function kernelSize = getKernelSize(obj)
            % Returns the kernelSize
            kernelSize = obj.kernelSize;
        end
    end
end


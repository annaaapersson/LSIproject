classdef settingsClass < handle
    % All settings are stored in a settings class
    
    properties
        kernelSize
        %kernelSize = 9;
        %fps
    end
    
    methods
        function obj = settingsClass()
            % Constructor for settings with default parameters
            obj.kernelSize = 3;
        end

        function setKernelSize(obj, kS)
            % Sets the kernelSize
            obj.kernelSize = kS;
            %guidata(handles);
        end
    end
end


classdef laserClass %< handle Think this is the best
    properties % Hold the data / state of the object
        port
    end
    
    % Methods usually used to define property values
    methods % Functions that can be carried out on the object
        % Constructor
        function laser = laserClass()
            laser.port = establishLaserConnection();
        end
        % Don't think this fkn works
        function [] = openLaser(laser)
            fopen(laser.port);
        end
    end
end
classdef laserClass
    
    properties
    end
    
    methods(Static)
        % Constructor
        function laser = establishLaserConnection()
            laser = serial('com4');
            fprintf('Laser Connection Established');
        end
        
        function start(laser)
            fopen(laser);
        end
        
        function stop(laser)
            fclose(laser);
            delete(laser)
            clear laser
        end
    end
end
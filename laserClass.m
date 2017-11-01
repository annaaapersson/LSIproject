classdef laserClass
    
    properties
        laser      
    end
    
    methods
        % Constructor
        function laser = laserClass()
            %establishLaserConnection();
            laser = establishLaserConnection();
        end
        
        function start(laser)
            fopen(laser);
        end
        
        function stop(laser)
            fclose(laser);
        end
    end
end
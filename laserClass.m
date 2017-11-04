
classdef laserClass
    
    properties
    end
    
    methods(Static)
        
        function laser = establishLaserConnection()
            laser = serial('com4');
            fprintf('Laser Connection Established');
        end
        
        function start(laser)
            fopen(laser);
            set(laser, 'RequestToSend', 'on');  %send power to the laser to make it ON
            pause(5)            %turn laser on for 5 secs
        end
        
        function stop(laser)
            set(laser, 'RequestToSend', 'off');
            fclose(laser);
            delete(laser)
            clear laser
        end
    end

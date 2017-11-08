classdef laserClass
    % To find ports, type 'instrfind'
    properties
        laserName
    end
    
    methods      
        function laser = laserClass()
            laser.laserName = serial('com3');
            fprintf('Laser Connection Established');
        end
        
        function start(obj)
            fopen(obj.laserName);
            set(obj.laserName, 'RequestToSend', 'on');  %send power to the laser to make it ON
            %pause(5)            %turn laser on for 5 secs
        end
        
        function stop(obj)
            set(obj.laserName, 'RequestToSend', 'off');
            fclose(obj.laserName); % Move these 3 to delete laser.    
        end
        
        function delete(obj)
            delete(obj.laserName);
            clear obj.laserName;
        end
    end
end

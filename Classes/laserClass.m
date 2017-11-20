classdef laserClass
    % To find ports, type 'instrfind'
    % Pause may be used if necessaru but should be avoided
    % pause(#) % Pause program # seconds
    properties
        laserName
    end
    
    methods      
        function laser = laserClass()
            laser.laserName = serial('COM3');
            assignin('base', 'myLaser', laser.laserName);
            % fprintf('Laser Connection Established');
        end
        
        function start(obj)
            fopen(obj.laserName);
            %set(obj.laserName, 'RequestToSend', 'on');  %send power to the laser to make it ON
            % No pause needed, cuz program don't continue before it gets 
            % feedback from laser that it is finnished.
        end
        
        function stop(obj)
            % Laser turns off really fast
            %set(obj.laserName, 'RequestToSend', 'off');
            fclose(obj.laserName);  
        end
        
        function delete(obj)
            delete(obj.laserName);
            clear obj.laserName;
        end
    end
end

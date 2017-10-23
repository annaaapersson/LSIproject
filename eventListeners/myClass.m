classdef myClass < handle
    properties
        value
    end
    % Event is something that can be triggered by notify
    events
        myEvent 
    end
    methods
        function getDataAndNotify(obj)
            A = 1;
            B = 2;
            C = 3;
            eventdata = myEventData(A, B, C); % Creates an object
            notify(obj, 'myEvent', eventdata); % Notifies the event
        end
        
        function myListenerCallback(obj, eventdata) %Activates when event is changed
            disp('myListenerCallback ONLINE')
            disp(eventdata.A)
        end
        
        function loadImage()
            
        end
        end
end
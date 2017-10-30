classdef ClassName < handle
    events
        EventName
    end
    
    methods
        function anyMethod(obj)
            ...
            notify(obj,'EventName');
        end
    end
end



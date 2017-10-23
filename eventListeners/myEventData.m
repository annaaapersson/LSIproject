classdef myEventData < event.EventData % the class must inherit from event.EventData
    properties
        A
        B
        C
    end
    methods
        function obj = myEventData(A, B, C)
            obj.A = A;
            obj.B = B;
            obj.C = C;
        end
    end
end



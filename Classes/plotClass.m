classdef plotClass < handle
    
    properties
        valuesAllROI1
        valuesAllROI2
        counter
        imageTimes = [];
    end
    
    methods
        % Constructor
        function plotObj = plotClass()
            plotObj.valuesAllROI1 = [];
            plotObj.valuesAllROI2 = [];
        end
        
        function insertValueROI1(object, value1, value2)
            if isempty(object.counter)
                tic;
            end
            object.valuesAllROI1 = [object.valuesAllROI1 value1];
            object.valuesAllROI2 = [object.valuesAllROI2 value2];
            elapsedTime = toc;
            object.counter = [object.counter elapsedTime];
        end
        
        function plotValues(object, ax)
            axes(ax);
            temp = object.counter;
            plot(temp, object.valuesAllROI1, 'r',...
                temp, object.valuesAllROI2, 'b');
            try
                vline(object.imageTimes);
            catch
                % Just catches that cannot print any vline of an empty
                % vector
            end
            ylim([0 1]);
        end
          
         % When an image is taken, that timepoint is added
         function imageWasTaken(object)
             object.imageTimes = [object.imageTimes,...
                 object.counter(length(object.counter))];
         end
         
         function resetPlot(plotObj)
             plotObj.valuesAllROI1 = [];
             plotObj.valuesAllROI2 = [];
             plotObj.counter = [];
             plotObj.imageTimes = [];
         end
    end
end
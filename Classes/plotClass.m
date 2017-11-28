classdef plotClass < handle % might be used
    
    properties
        valuesAllROI1
        valuesPlotROI1
        valuesAllROI2
        valuesPlotROI2
        counter = 0
    end
    
    methods
        % Constructor
        function plotObj = plotClass(numValues, numValuesPlot)
            plotObj.valuesAllROI1 = zeros(1, numValues);
            plotObj.valuesPlotROI1 = zeros(1, numValuesPlot);
            plotObj.valuesAllROI2 = zeros(1, numValues);
            plotObj.valuesPlotROI2 = zeros(1, numValuesPlot);
        end
        
        function insertValueROI1(object, value1, value2)
            if object.counter == 0
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
            object.valuesAllROI1;
            plot(temp, object.valuesAllROI1, ...
                temp, object.valuesAllROI2)
        end
    end
end
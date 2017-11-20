classdef plotClass < handle % might be used
    
    properties
        valuesAllROI1
        valuesPlotROI1
        valuesAllROI2
        valuesPlotROI2
        counter = 1
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
            object.valuesAllROI1 = [object.valuesAllROI1 value1];
            object.valuesAllROI2 = [object.valuesAllROI2 value2];
            object.counter = object.counter + 1;
        end
        
        function plotValues(object, ax)
            axes(ax);
            temp = object.counter;
            xAxis = 1:temp;
            plot(xAxis, object.valuesAllROI1(1:temp), ...
            xAxis, object.valuesAllROI2(1:temp))
        end
    end
end
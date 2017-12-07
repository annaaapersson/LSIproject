classdef plotClass < handle % might be used
    
    properties
        valuesAllROI1
        valuesPlotROI1
        valuesAllROI2
        valuesPlotROI2
        counter
        imageTimes = [];
    end
    
    methods
        % Constructor
        function plotObj = plotClass()
            plotObj.valuesAllROI1 = [];
            plotObj.valuesPlotROI1 = [];
            plotObj.valuesAllROI2 = [];
            plotObj.valuesPlotROI2 = [];
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
              plot(temp, object.valuesAllROI1, 'r', ...
                 temp, object.valuesAllROI2, 'b');
             if ~isempty(object.imageTimes)
                 vline(object.imageTimes);
             end
             
             try
                 
             catch
                 %disp('Warning: imageTimes in plotobject did not fulfil vline requirements ');
                 %warning('Warning: imageTimes in plotobject did not fulfil vline requirements.');
             end
             %h = vline(imageTimes,{'g','r','b'},{'Image 1','Image 2','Image 3'})
              ylim([0 1]);
        end
          
         % When an image is taken, that timepoint is added
         function imageWasTaken(object)
             object.imageTimes = [object.imageTimes,...
                 object.counter(length(object.counter))];
         end
         
         function resetPlot(plotObj)
              plotObj.valuesAllROI1 = [];
              %plotObj.valuesPlotROI1 = [];
              plotObj.valuesAllROI2 = [];
              %plotObj.valuesPlotROI2 = [];
              plotObj.counter = [];
              plotObj.imageTimes = [];
          end
         
    end
end
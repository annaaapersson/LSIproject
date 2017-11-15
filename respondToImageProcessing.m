classdef respondToImageProcessing < handle
    
%     properties
%     end
   methods
      function obj = respondToImageProcessing(imageWindow)
         addlistener(imageWindow,'processImageEvent',@respondToImageProcessing.handleEvnt);
      end
   end
   methods (Static)
      function handleEvnt(src,~)
         %while src.State == true
            %handlesFromGUI = guidata(hObject);
            %h = gcbo
            %kernelSizeValue = h.settings.kernelSize
         end
      end
   end
end
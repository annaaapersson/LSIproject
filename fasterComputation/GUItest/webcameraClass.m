classdef webcameraClass < handle % might be used
    
    properties
        cameraName
        src
        image
        rawImage
    end
    
    methods
        % Constructor
        function camera = webcameraClass()
            camera.src = webcam(1);
        end
        
        function captureImage(obj)
            obj.rawImage = double(rgb2gray(snapshot(obj.src)));
        end
        
        function object = setDisplayImage(object, img2, ax)
            colormap(jet(100));
            clims = [-1*10^(-3), 0];
            axes(ax);
            object.image = imagesc(-1*img2, clims);
%             object.image = bilden;
        end
        
    end
end
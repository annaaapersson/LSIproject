classdef webcameraClass < handle % might be used
    
    properties
        cameraName
        src
        image
        test
    end
    
    methods
        % Constructor
        function camera = webcameraClass()
            camera.src = webcam(1);
        end
        
        function imageCaptured = captureImage(obj)
            imageCaptured = double(rgb2gray(snapshot(obj.src)));
        end
        
        function object = setDisplayImage(object, img2)
            colormap(jet(100));
            clims = [-1*10^(-3), 0];
            bilden = imagesc(-1*img2, clims);
            object.image = bilden;
            object.test = 2;
        end
    end
end
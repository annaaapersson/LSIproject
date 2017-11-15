function [] = handleImageWindowCallback(obj, handles)
% Displays the image when the LSIimageWindow is active
myCamera = handles.camera.cameraName;

if(handles.LSIimageWindow.State)
    rawImage = snapshot(myCamera);
    lightCorrectedImage = rawImage;
    kernelSize = 5;
    contrastImage = calculateContrastNewSumMinimize(kernelSize, lightCorrectedImage);
    imshow(contrastImage, 'Colormap', jet(255));
end


end


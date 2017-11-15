function [] = imageProcessing(handles)
% Calculates contrast and displays image in GUI
myCamera = handles.camera.theCamera;

while (handles.LSIimageWindow.State == true)
    %% If using webcam
    imageNoLaser = snapshot(myCamera);  
    % Turn on laser
    imageLaser = snapshot(myCamera);  
    % Turn off laser
    %% If using pointgrey camera and laser:
%     start(myCamera)
%     trigger(myCamera); % If choosing manual trigger option
%     imageNoLaser = getdata(myCamera);
    %handles.laser.start; % Turn on laser
    % imageLaser = getdata(myCamera);
    %handles.laser.stop; % Turn off laser
    %% Image processing
    %handles.settings.kernelSize
    ambientLightCorrectedImage = imageLaser - imageNoLaser;
%     contrastImage = calculateContrastPreMatrix(ambientLightCorrectedImage,...
%         handles.settings.kernelSize);
    contrastImage = calculateContrastNewSumMinimize(handles.settings.kernelSize,...
        ambientLightCorrectedImage);
    imshow(contrastImage, 'Colormap', jet(255));
    pause(0.01) % Neccessary in order to let other GUI be activated
end

end


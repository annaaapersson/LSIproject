function startSystemWithSetParametersButton_Callback(hObject, eventdata, handles)

    myCamera = handles.camera.cameraName;
    vidRes = myCamera.VideoResolution;
    nBands = myCamera.NumberOfBands ;
    %hImage = image( zeros(vidRes(2), vidRes(1), nBands));
    % Set up the update preview window function.
    hImage = image( zeros(172, 231, nBands));
    % Image processing occur here.
    setappdata(hImage,'UpdatePreviewWindowFcn',@previewFcn);
    
preview(myCamera, hImage);
function addROI1_Callback(hObject, eventdata, handles, datas)

    handles = guidata(hObject);
    % creates a rectangular of inserted size after initializing them
    % with the apply buttons
    %display(handles.apply11Button);
    %datas11 = handles.apply11Button.UserData;
    %datas12 = handles.apply12Button.UserData;
    
    %% Linas New part
    % Clear all previously stored plot-data
    handles.plotObject.resetPlot();
    % Clear all previously stored ROI-data
    %handles.ROI1.resetROI();
    %handles.ROI2.resetROI();
    % Remove all previous measurement data
    handles.measurementData.resetMeasurementData();
    % Remove data from he roi graph
    cla(handles.roiGraph);
    guidata(hObject, handles);
    handles = guidata(hObject);
    %%
    % Creates a mask around the marked area with ones
    handles.LSIimageWindow.activeImrect = 1;
    handles.stopRecordingButton.Enable = 'on';
    handles.startRecordingButton.Enable = 'on';
    
    %h = imrect(gca, [datas12.x datas12.y datas11.width datas11.height]);
    %display(handles.apply12Button.UserData);
    %display(handles.apply11Button.UserData);
    %display(datas11.height);
    %display(datas12.x);
    
    guidata(hObject, handles);
end
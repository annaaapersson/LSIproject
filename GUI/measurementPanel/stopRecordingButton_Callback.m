function stopRecordingButton_Callback(hObject, eventdata)

handles = guidata(hObject);

% Take an image of the ROI-figure and store it in the measuementClass
handles.measurementData.saveROIImage(handles);

% Stop running image flow
handles.LSIimageWindow.deactivate;

handles.startRecordingButton.Visible = 'on';
handles.stopRecordingButton.Visible = 'off';

handles.startRecordingPanel.Visible = 'off';
handles.savePanel.Visible = 'on';
handles.saveMeasurementPanel.Visible = 'on';

handles.LSIimageWindow.activeCalcROI = 0;

plotValues(handles.plotObject, handles.roiGraphDB);
plotValues(handles.plotObject, handles.smallerRoiGraph);

% Update handles
guidata(hObject, handles);


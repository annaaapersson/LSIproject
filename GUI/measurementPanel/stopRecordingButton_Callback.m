function stopRecordingButton_Callback(hObject, eventdata)

handles = guidata(hObject);

% Take an image of the ROI-figure and store it in the measuementClass
handles.measurementData.saveROIImage(handles);

% Stop running image flow
handles.LSIimageWindow.deactivate;

handles.startRecordingButton.Visible = 'on';
handles.stopRecordingButton.Visible = 'off';

handles.startRecordingPanel.Visible = 'off';

if handles.isLogged == 1
    handles.savePanel.Visible = 'on';
    handles.saveMeasurementPanel.Visible = 'on';
else
    handles = displayData(handles);
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
end

handles.LSIimageWindow.activeCalcROI = 0;

plotValues(handles.plotObject, handles.roiGraphDB);
plotValues(handles.plotObject, handles.smallerRoiGraph);

guidata(hObject, handles);


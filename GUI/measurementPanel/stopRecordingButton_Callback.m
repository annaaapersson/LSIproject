function stopRecordingButton_Callback(hObject, eventdata)

handles = guidata(hObject);

% Stop running image flow
handles.LSIimageWindow.deactivate;

handles.startRecordingButton.Visible = 'on';
handles.stopRecordingButton.Visible = 'off';

handles.startRecordingPanel.Visible = 'off';
handles.savePanel.Visible = 'on';
handles.saveMeasurementPanel.Visible = 'on';

handles.LSIimageWindow.activeCalcROI = 0;

plotValues(handles.plotObject, handles.roiGraphDB);

% Put the ROI vectors in the workspace - temporary solution
assignin('base', 'ROI_1_vector', handles.plotObject.valuesAllROI1);
assignin('base', 'ROI_2_vector', handles.plotObject.valuesAllROI2);

guidata(hObject, handles);


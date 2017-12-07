function stopRecordingButton_Callback(hObject, eventdata)

handles = guidata(hObject);

% Take an image of the ROI-figure and store it in the measuementClass
handles.measurementData.saveROIImage(handles);

% Stop running image flow
handles.LSIimageWindow.deactivate;

handles.startRecordingButton.Visible = 'on';
handles.stopRecordingButton.Visible = 'off';

if handles.isLogged == 1
    handles.savePanel.Visible = 'on';
    handles.saveMeasurementPanel.Visible = 'on';
    handles.stopRecordingButton.Visible = 'off';
    handles.startRecordingPanel.Visible = 'off';

else
    handles = displayData(handles);
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
end

handles.LSIimageWindow.activeCalcROI = 0;

plotValues(handles.plotObject, handles.roiGraphDB);
plotValues(handles.plotObject, handles.smallerRoiGraph);

% enabling of the image buttons 1-3
    handles.saveImage1.Enable = 'on';
    handles.saveImage2.Enable = 'on';
    handles.saveImage3.Enable = 'on';
% Put the ROI vectors in the workspace - temporary solution
%assignin('base', 'ROI_1_vector', handles.plotObject.valuesAllROI1);
%assignin('base', 'ROI_2_vector', handles.plotObject.valuesAllROI2);
cla(handles.roiGraph);
guidata(hObject, handles);


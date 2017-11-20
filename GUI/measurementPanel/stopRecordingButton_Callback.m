function stopRecordingButton_Callback(hObject, eventdata)

handles = guidata(hObject);


handles.startRecordingButton.Visible = 'on';
handles.stopRecordingButton.Visible = 'off';

handles.startRecordingPanel.Visible = 'off';
handles.savePanel.Visible = 'on';
handles.saveMeasurementPanel.Visible = 'on';

guidata(hObject, handles);


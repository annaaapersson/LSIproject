function startRecordingButton_Callback(hObject, eventdata)

handles = guidata(hObject);
% toggle visible off of residual objects not contributing to this 
% interface
handles.patientPanel.Visible = 'off';
handles.roi1Panel.Visible = 'off';
handles.roi2Panel.Visible = 'off';

% change button    
handles.startRecordingPanel.Visible = 'on';
handles.savePanel.Visible = 'off';
handles.saveMeasurementPanel.Visible = 'off';

%savePanel.Visible = 'on';
handles.stopRecordingButton.Visible = 'on';

guidata(hObject);


% if startRecordingPanel.Visible == 'off'
%     % toggle startStopRecordingPanel on
%     startRecordingPanel.Visible = 'on';    
% else    
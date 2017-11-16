function startRecordingButton_Callback(hObject, eventdata, handles)
   

% toggle visible off of residual objects not contributing to this 
% interface
handles.patientPanel.Visible = 'off';
handles.roi1Panel.Visible = 'off';
handles.roi2Panel.Visible = 'off';

% if startRecordingPanel.Visible == 'off'
%     % toggle startStopRecordingPanel on
%     startRecordingPanel.Visible = 'on';    
% else    

    % change button    
    handles.startRecordingPanel.Visible = 'off';
    handles.savePanel.Visible = 'on';
    handles.saveMeasurementPanel.Visible = 'on';
%savePanel.Visible = 'on';
end
function patientButton_Callback(hObject, eventdata, handles)

    % toggle residual objects invisible
    handles.roi1Panel.Visible = 'off';
    handles.roi2Panel.Visible = 'off';
    handles.startRecordingPanel.Visible = 'off';
    handles.savePanel.Visible = 'off';
    handles.saveMeasurementPanel.Visible = 'off';
  
    % toggle on patientpanel
    handles.patientPanel.Visible = 'on';


end
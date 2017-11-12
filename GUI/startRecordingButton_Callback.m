function startRecordingButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)
   

% toggle visible off of residual objects not contributing to this 
% interface
patientPanel.Visible = 'off';
roi1Panel.Visible = 'off';
roi2Panel.Visible = 'off';

% if startRecordingPanel.Visible == 'off'
%     % toggle startStopRecordingPanel on
%     startRecordingPanel.Visible = 'on';    
% else    

    % change button    
    startRecordingPanel.Visible = 'off';
    savePanel.Visible = 'on';
    saveMeasurementPanel.Visible = 'on';
%savePanel.Visible = 'on';
end
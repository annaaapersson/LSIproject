function patientButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)
    
% toggle residual objects invisible
roi1Panel.Visible = 'off';
roi2Panel.Visible = 'off';
startRecordingPanel.Visible = 'off';
savePanel.Visible = 'off';
saveMeasurementPanel.Visible = 'off';

% toggle on patientpanel
patientPanel.Visible = 'on';


end
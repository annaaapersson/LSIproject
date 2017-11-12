function historyButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           8
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)

% toggle off visibilty
settingsPanel.Visible = 'off';
measurePanel.Visible = 'off';
examinationPanel.Visible = 'off';
videoPanel.Visible = 'off';

% change position of auxillary panel and section button panel
sectionButtonPanel.Position(2) = 216/720;
auxillaryPanel.Position(2) = 218/720;

% toggle on visibility of dedicated panels
historyPanel.Visible = 'on';
patientDBPanel.Visible = 'on';
examinatonTablePanel.Visible = 'on';
end
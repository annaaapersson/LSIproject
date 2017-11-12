function settingsButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           8
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)

% toggle off all panel which are not applicable for settings
measurePanel.Visible = 'off';
historyPanel.Visible = 'off';
examinationPanel.Visible = 'off';

% shifting the auxillary plane to be in the right position
sectionButtonPanel.Position(2) = 505/720;
auxillaryPanel.Position(2) = 507/720;

% toggle the visibility of the dedicated planes on
settingsPanel.Visible = 'on'; 
videoPanel.Visible = 'on';
end
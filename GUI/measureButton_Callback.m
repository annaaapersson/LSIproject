
function measureButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           8
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)
% toggle off panels not needed for this callback function
settingsPanel.Visible = 'off';
historyPanel.Visible = 'off';
examinationPanel.Visible = 'off';
roi1Panel.Visible = 'off';
roi2Panel.Visible = 'off';
startRecordingPanel.Visible = 'off';
savePanel.Visible = 'off';
saveMeasurementPanel.Visible = 'off';

% move the auxillary panel & section button panel
sectionButtonPanel.Position(2) = 360/720
auxillaryPanel.Position(2) = 362/720;

measurePanel.Visible = 'on';
patientPanel.Visible = 'on';
videoPanel.Visible = 'on';

end
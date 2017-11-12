function roiButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           8
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)

% toggle residual panels invisible
patientPanel.Visible = 'off';
startRecordingPanel.Visible = 'off';
savePanel.Visible = 'off';
saveMeasurementPanel.Visible = 'off';

% toggle ROI1 and ROI2 visible
roi1Panel.Visible = 'on';
roi2Panel.Visible = 'on';
end
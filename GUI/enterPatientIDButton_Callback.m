function enterPatientIDButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)
% toggle off history panel
%historyPanel.Visible = 'off';

patientInfoPanel.Visible = 'on';
imageDisplayPanel.Visible = 'on';
examinationPanel.Visible = 'on';

end
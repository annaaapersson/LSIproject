function saveExaminationButton_Callback(hObject, eventdata, auxillaryPanel,...         
    enterPatientIDPanel, examinationPanel, examinationTablePanel,...   
    sectionButtonPanel,historyPanel,imageDisplayPanel,measurePanel, ...           
    patientDBPanel,patientInfoPanel,patientPanel,roi1Panel,...
    roi2Panel,saveMeasurementPanel,savePanel,settingsPanel,...
    startRecordingPanel,videoPanel)

    % toggle off not needed panels
    %videoPanel.Visible = 'off';
    %measurePanel.Visible = 'off';
    
    % toggle on examination panel 
    examinationPanel.Visible = 'on';
    imageDisplayPanel.Visible = 'on';
    patientInfoPanel.Visible = 'on';


end
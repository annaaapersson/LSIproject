function saveExaminationButton_Callback(hObject, eventdata,handles)

    % toggle off not needed panels
    %videoPanel.Visible = 'off';
    %measurePanel.Visible = 'off';
    
    % toggle on examination panel 
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';


end
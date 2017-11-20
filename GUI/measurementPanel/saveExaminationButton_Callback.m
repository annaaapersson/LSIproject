function saveExaminationButton_Callback(hObject, eventdata)

    % toggle off not needed panels
    handles = guidata(hObject);
    %handles.videoPanel.Visible = 'off';
    %handles.measurePanel.Visible = 'off';    
    % toggle on examination panel 
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';

    guidata(hObject, handles);
end
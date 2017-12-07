function saveExaminationButton_Callback(hObject, eventdata)

    % toggle off not needed panels
    handles = guidata(hObject);
   
    % toggle on examination panel 
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
    

    displayData(handles);
        
    examinationName = handles.examinationNameEditField.String;
    data = struct('examinationName', examinationName);
    handles.examinationNameEditField.String = '';
    handles.saveExaminationButton.UserData = data;
    handles.saveImage1.Enable = 'on';
    handles.saveImage2.Enable = 'on';
    handles.saveImage3.Enable = 'on';
    guidata(hObject, handles);
end
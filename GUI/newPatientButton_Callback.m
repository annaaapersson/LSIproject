function newPatientButton_Callback(hObject, eventdata)

    handles = guidata(hObject);
    handles.patientDBPanel.Visible = 'on';
    handles.examinationTablePanel.Visible = 'off';
    guidata(hObject, handles);
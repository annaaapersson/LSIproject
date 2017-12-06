function patientLogoutButton_Callback(hObject, eventdata)
    fig = findobj('Tag', 'fig');
    handles = guidata(fig);
    handles.isLogged = 0;
    handles.patientLogoutButton.Visible = 'off';
    handles.commonPatientIDLabel.String = '';
    handles.loggedPatient = '';
    handles.loggedPatientID = '';
    handles.examinationTablePanel.Visible = 'off';
    visible = strcmp(handles.historyPanel.Visible, 'on');
    if visible
        handles.patientDBPanel.Visible = 'on';
    else
        handles.examinationPanel.Visible = 'off';
    end
    guidata(fig, handles);


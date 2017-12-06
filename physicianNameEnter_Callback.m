function physicianNameEnter_Callback(hObject, eventdata)
    % getting the handles
    handles = guidata(hObject);
    
    % saving the physicians name in the handle struct
    handles.physicianName = handles.physicianNameEdit.String;
    handles.startPagePanel.Visible = 'off';
    handles.commonPhysicianLabel.String = handles.physicianName;
    handles.settingsPanel.Visible = 'on';
    handles.videoPanel.Visible = 'on';
    guidata(hObject, handles);
    
    
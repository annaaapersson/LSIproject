function historyButton_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

% toggle off visibilty
handles.settingsPanel.Visible = 'off';
handles.measurePanel.Visible = 'off';
handles.examinationPanel.Visible = 'off';
handles.videoPanel.Visible = 'off';

% change position of auxillary panel and section button panel
handles.sectionButtonPanel.Position(2) = 216/720;
handles.auxillaryPanel.Position(2) = 218/720;

% toggle on visibility of dedicated panels
handles.historyPanel.Visible = 'on';
handles.patientDBPanel.Visible = 'on';
handles.examinatonTablePanel.Visible = 'on';

guidata(hObject, handles);
end
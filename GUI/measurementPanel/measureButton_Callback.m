
function measureButton_Callback(hObject, eventdata)

handles = guidata(hObject);
%% GUI
% toggle off panels not needed for this callback function
handles.settingsPanel.Visible = 'off';
handles.historyPanel.Visible = 'off';
handles.examinationPanel.Visible = 'off';
handles.roi1Panel.Visible = 'off';
handles.roi2Panel.Visible = 'off';
handles.startRecordingPanel.Visible = 'off';
handles.savePanel.Visible = 'off';
handles.saveMeasurementPanel.Visible = 'off';
handles.startPagePanel.Visible = 'off';

% move the auxillary panel & section button panel
handles.sectionButtonPanel.Position(2) = 360/720
handles.auxillaryPanel.Position(2) = 362/720;

handles.measurePanel.Visible = 'on';
if handles.isLogged == 1
    handles.roi1Panel.Visible = 'on';
else
    handles.patientPanel.Visible = 'on';
end
handles.videoPanel.Visible = 'on';

%% Functionality
handles.LSIimageWindow.activate(handles);

%update handles
guidata(hObject, handles);
end
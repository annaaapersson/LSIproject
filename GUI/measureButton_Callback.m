
function measureButton_Callback(hObject, eventdata, handles)

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

% move the auxillary panel & section button panel
handles.sectionButtonPanel.Position(2) = 360/720
handles.auxillaryPanel.Position(2) = 362/720;

handles.measurePanel.Visible = 'on';
handles.patientPanel.Visible = 'on';
handles.videoPanel.Visible = 'on';

%% Functionality
handles.LSIimageWindow.activate(handles);
end
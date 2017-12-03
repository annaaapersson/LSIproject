function settingsButton_Callback(hObject, eventdata, handles)
%% GUI
% toggle off all panel which are not applicable for settings
handles = guidata(hObject);
handles.measurePanel.Visible = 'off';
handles.historyPanel.Visible = 'off';
handles.examinationPanel.Visible = 'off';

% shifting the auxillary plane to be in the right position
handles.sectionButtonPanel.Position(2) = 505/720;
handles.auxillaryPanel.Position(2) = 507/720;

% toggle the visibility of the dedicated planes on
handles.settingsPanel.Visible = 'on'; 
handles.videoPanel.Visible = 'on';

%% Functionallity 
%Deactivate image flow
handles.LSIimageWindow.deactivate;
end
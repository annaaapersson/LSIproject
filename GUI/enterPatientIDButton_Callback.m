function enterPatientIDButton_Callback(hObject, eventdata, handles)
% toggle off history panel
%historyPanel.Visible = 'off';

handles.patientInfoPanel.Visible = 'on';
handles.imageDisplayPanel.Visible = 'on';
handles.examinationPanel.Visible = 'on';

end
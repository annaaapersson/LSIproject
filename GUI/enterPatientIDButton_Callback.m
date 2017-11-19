function enterPatientIDButton_Callback(hObject, eventdata)
% toggle off history panel
%historyPanel.Visible = 'off';

handles = guidata(hObject);

handles.patientInfoPanel.Visible = 'on';
handles.imageDisplayPanel.Visible = 'on';
handles.examinationPanel.Visible = 'on';

patientID = str2double(handles.enterPatientIDEditField.String);

data = struct('PatientID', patientID);
handles.enterPatientIDButton.UserData = data;

% eventlistener if visibility of plattform is off
%------------------------------------------------
% visibility = 'on';
% if isequal(handles.videoStream.Visible, visibility)
%     display('ja')
% 
% else
%     display('nej');
% end

guidata(hObject, handles);


end
function enter2Button_Callback(hObject, eventdata)

handles = guidata(hObject);

patientName = handles.nameField.String;
SSNField = handles.SSNEdit.String; 
handles.commonPatientIDLabel.String = [SSNField ' ' patientName];
handles.loggedPatient = patientName;
handles.loggedPatientID = SSNField;
handles.patientLogoutButton.Visible = 'on';
data = struct('PatientID', patientName, 'SSN', SSNField);
handles.nameField.String = '';
handles.SSNEdit.String = '';
handles.enter2Button.UserData = data;
handles.database.addNewPatient(SSNField, patientName);

guidata(hObject, handles);
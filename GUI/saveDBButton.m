function saveDBButton(hObject, eventdata)
%loading the updated handles from gcbo
handles = guidata(hObject);

patientID = handles.nameDBEdit.String;
SSN = handles.SSNDBEdit.String;

data = struct('patienName', patientName, 'SSN', SSN);
handles.saveDBButton.UserData = data;

% Input the patient into the datbase
handles.database.addNewPatient(SSN, patientName);
handles.commonPatientIDLabel.String = [SSN ' ' patientName];
handles.patientLogoutButton.Visible = 'on';

% display(handles.enterButton.UserData);
handles.nameDBEdit.String = '';
handles.SSNDBEdit.String = '';

guidata(hObject, handles);  
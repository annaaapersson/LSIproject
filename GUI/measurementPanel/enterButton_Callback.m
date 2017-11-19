function enterButton_Callback(hObject, eventdata)

handles = guidata(hObject);

patientName = handles.patientIDField.String;
data = struct('PatientID', patientName);

handles.enterButton.UserData = data;

guidata(hObject, handles);
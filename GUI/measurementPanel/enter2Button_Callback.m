function enter2Button_Callback(hObject, eventdata)

handles = guidata(hObject);

patientName = handles.nameField.String;
SSNField = handles.SSNEdit.String; 

data = struct('PatientID', patientName, 'SSN', SSNField);

handles.enter2Button.UserData = data;


guidata(hObject, handles);
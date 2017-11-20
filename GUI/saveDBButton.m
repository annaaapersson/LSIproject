function saveDBButton(hObject, eventdata)
%loading the updated handles from gcbo
handles = guidata(hObject);

patientName = handles.nameDBEdit.String;
SSN = str2double(handles.SSNDBEdit.String);
handles.
data = struct('patienName', patientName, 'SSN', SSN);
handles.saveDBButton.UserData = data;

% display(handles.enterButton.UserData);

guidata(hObject, handles); 
function enterButton_Callback(hObject, eventdata)

handles = guidata(hObject);

patientName = handles.patientIDField.String;
data = struct('PatientID', patientName);

handles.enterButton.UserData = data;

try
      [exists, data] = handles.database.checkIfValidPatientID(patientName);
      if  ~exists
          handles.patientDBPanel.Visible = 'off';
          handles.examinationTablePanel.Visible = 'on';
          handles.commonPatientIDLabel.String = [data.patient_ID{1} ' ' data.patient_name{1}];
          handles.loggedPatient = data.patient_name{1};
          handles.loggedPatientID = data.patient_ID{1};
          handles.patientLogoutButton.Visible = 'on';
          handles.patientIDField.String = '';
          handles.isLogged = 1;
      else

      end
catch
          handles.patientIDField.String = '';
end

guidata(hObject, handles);
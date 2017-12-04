function enterButton_Callback(hObject, eventdata)

handles = guidata(hObject);

patientID= handles.patientIDField.String;
data = struct('PatientID', patientID);

handles.enterButton.UserData = data;

try
      [exists, data] = handles.database.checkIfValidPatientID(patientID);
      if  ~exists
          handles.patientDBPanel.Visible = 'off';
          handles.examinationTablePanel.Visible = 'on';
          handles.commonPatientIDLabel.String = [data.patient_ID{1} ' ' data.patient_name{1}];
          handles.loggedPatient = data.patient_name{1};
          % Save the patient SSN 
          handles.loggedPatientID = patientID;
          handles.patientLogoutButton.Visible = 'on';
          handles.patientIDField.String = '';
          handles.isLogged = 1;
      else

      end
catch
          handles.patientIDField.String = '';
end

guidata(hObject, handles);
function enterPatientIDButton_Callback(hObject, eventdata)
% toggle off history panel
%historyPanel.Visible = 'off';

handles = guidata(hObject);
patientID = handles.enterPatientIDEditField.String;

try
    [exists, data] = handles.database.checkIfValidPatientID(patientID);
    if  ~exists
          handles.patientDBPanel.Visible = 'off';
          handles.examinationTablePanel.Visible = 'on';
          handles.commonPatientIDLabel.String = [data.patient_ID{1} ' ' data.patient_name{1}];
          handles.loggedPatient = data.patient_name{1};
          handles.loggedPatientID = data.patient_ID{1};
          handles.enterPatientIDEditField.String = '';
          handles.patientLogoutButton.Visible = 'on';
          patientData = handles.database.getTableData(data.patient_ID{1}); 
          handles.examinationDataTable.Data = table2cell(patientData); 
          handles.isLogged = 1;
          
    else
    end
catch
end


guidata(hObject, handles);


end




% eventlistener if visibility of plattform is off
%------------------------------------------------
% visibility = 'on';
% if isequal(handles.videoStream.Visible, visibility)
%     display('ja')
% 
% else
%     display('nej');
% end
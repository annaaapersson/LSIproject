function cellSelection_Callback(hObject, eventdata)
    handles = guidata(hObject);
    selectedRow = eventdata.Indices(1);
    selectedExamination = handles.examinationDataTable.Data(selectedRow,:);
    display(selectedExamination);
    
    %display(selectedExamination{1,4});
    %examinationName = selectedExamination{1,3};

    kernel = selectedExamination{1,9};
    patientID = selectedExamination{1,1};
    examinationDate = ['Examination date: ', selectedExamination{1,2}];
    examName = selectedExamination{1,3};
    physician = selectedExamination{1,4};
    measurementData = selectedExamination{1,5};
    gain = sprintf('Gain: ISO %d', selectedExamination{1,6});
    exposure = sprintf('Exposure: %d ms', selectedExamination{1,7});
    kernelSizeValue = sprintf('Kernel size: %d x %d px', kernel, kernel);
    
    %handles.patientIDDBLabel.String = handles.patientID;
    handles.examinationTitleLabel.String = examName;
    handles.exposureValueLabel.String = exposure;
    handles.gainValueLabel.String = gain;
    handles.kernelSizeValueLabel.String = kernelSizeValue;
    handles.examinationDateLabel.String = examinationDate;
    handles.patientIDDBLabel.String = patientID;
    handles.patientNameDBLabel.String = handles.loggedPatient;
    
    %handles.patientNameDBLabel.String = handles.patientName;
    
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
    
    guidata(hObject, handles);
end
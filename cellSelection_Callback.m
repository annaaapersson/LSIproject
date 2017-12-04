function cellSelection_Callback(hObject, eventdata)
    handles = guidata(hObject);
    %% during this callback, the row of the clicked cell is determined and
    % further used to display the corresponding data in the examination
    % overview panel 
    
    selectedRow = eventdata.Indices(1);
    selectedExamination = handles.examinationDataTable.Data(selectedRow,:);
    display(selectedExamination);
    
    %% using the data obtained from the database to be displayed in the
    % examinationpanel 
    kernel = selectedExamination{1,7};
    patientID = selectedExamination{1,1};
    examinationDate = ['Examination date: ', selectedExamination{1,2}];
    examName = selectedExamination{1,3};
    physician = selectedExamination{1,4};
    measurementData = selectedExamination{1,5};
    gain = sprintf('Gain: ISO %d', selectedExamination{1,5});
    exposure = sprintf('Exposure: %d ms', selectedExamination{1,6});
    kernelSizeValue = sprintf('Kernel size: %d x %d px', kernel, kernel);
   
    
    %% assignment of the strings to the labels in the
    % overview panel for the examination 
    handles.examinationTitleLabel.String = examName;
    handles.exposureValueLabel.String = exposure;
    handles.gainValueLabel.String = gain;
    handles.kernelSizeValueLabel.String = kernelSizeValue;
    handles.examinationDateLabel.String = examinationDate;
    handles.patientIDDBLabel.String = patientID;
    handles.patientNameDBLabel.String = handles.loggedPatient;
    
    %% displaying the images corresponding to the choosen patient and
    %  timestamp
    baseline_image = handles.measurement.getImageFromFile(patientID, ...
        selectedExamination{1,2}, 'baseline');
    min_image = handles.measurement.getImageFromFile(patientID, ...
        selectedExamination{1,2}, 'min');
    max_image = handles.measurement.getImageFromFile(patientID, ...
        selectedExamination{1,2}, 'max');
    
    %% displaying the images in the GUI (examinationPanel)
    imshow(baseline_image, 'Parent', handles.image_t0);
    imshow(min_image, 'Parent', handles.image_t1);
    imshow(max_image, 'Parent', handles.image_t2);
      
    %% toggeling of the visibility of the panels
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
    
    guidata(hObject, handles);
end
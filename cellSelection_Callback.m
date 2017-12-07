function cellSelection_Callback(hObject, eventdata)
    handles = guidata(hObject);
    %% during this callback, the row of the clicked cell is determined and
    % further used to display the corresponding data in the examination
    % overview panel 
    
    selectedRow = eventdata.Indices(1);
    selectedExamination = handles.examinationDataTable.Data(selectedRow,:);
    
    %% using the data obtained from the database to be displayed in the
    % examinationpanel 
    kernel = selectedExamination{1,7}*2-1;
    patientID = selectedExamination{1,1};
    timestamp = selectedExamination{1,2};
    examinationDate = ['Examination date: ', timestamp];
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
    try
        baseline_image = handles.measurementData.getImageFromFile(patientID,... 
            timestamp, 'baseline');
        min_image = handles.measurementData.getImageFromFile(patientID, ...
            timestamp, 'min');
        max_image = handles.measurementData.getImageFromFile(patientID, ...
            timestamp, 'max');

        %% displaying the images in the GUI (examinationPanel)
        imshow(baseline_image, 'Parent', handles.image_T0);
        imshow(min_image, 'Parent', handles.image_T1);
        imshow(max_image, 'Parent', handles.image_T2);
    catch
    end
    %% plotting of the roi graphs from the corresponding .mat files
    [time, ROI1, ROI2, imageTimes] = getROIDataFromFile(patientID,...
    timestamp);
    axes(handles.roiGraphDB);
    plot(time, ROI1, 'r', time, ROI2, 'b');
    vline(imageTimes);
    ylim([0 1]);
    
    %% toggeling of the visibility of the panels
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
    
    guidata(hObject, handles);
end
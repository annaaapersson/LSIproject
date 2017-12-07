function handles = displayData(handles)
    global src;

    kernel = handles.kernelSizeSlider.Value;
    patientID = handles.loggedPatientID;
    examinationDate = ['Examination date: ', date];
    examName = handles.examinationNameEditField.String;
    gain = sprintf('Gain: ISO %d', src.Gain);
    exposure = sprintf('Exposure: %d ms', handles.exposureSlider.Value);
    kernelSizeValue = sprintf('Kernel size: %d x %d px', kernel*2-1, kernel*2-1);

    handles.examinationTitleLabel.String = examName;
    handles.exposureValueLabel.String = exposure;
    handles.gainValueLabel.String = gain;
    handles.kernelSizeValueLabel.String = kernelSizeValue;
    handles.examinationDateLabel.String = examinationDate;
    handles.patientIDDBLabel.String = patientID;
    handles.patientNameDBLabel.String = handles.loggedPatient; 
    
        % gets the images from the objects
    image1 = handles.measurementData.baselineImage;
    image2 = handles.measurementData.minImage;
    image3 = handles.measurementData.maxImage;
    image4 = handles.measurementData.ROIImage;
    
    % displayes them in the measurement overview
    imshow(image1, 'Parent', handles.image_T0);
    imshow(image2, 'Parent', handles.image_T1);
    imshow(image3, 'Parent', handles.image_T2);
    imshow(image4, 'Parent', handles.roiGraphDB);
    
    thisTimestamp = getTimestamp();
    if handles.isLogged ==1
        saveImageToFile(patientID, thisTimestamp, image1, 'baseline');
        saveImageToFile(patientID, thisTimestamp, image2, 'min');
        saveImageToFile(patientID, thisTimestamp, image3, 'max')
        saveImageToFile(patientID, thisTimestamp, image4, 'ROI');
        saveROIDataToFile(handles, patientID, thisTimestamp);
        handles.database.sendMeasurementData(handles, thisTimestamp, examName);
    end 
    
end
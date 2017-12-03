function saveExaminationButton_Callback(hObject, eventdata)

    % toggle off not needed panels
    handles = guidata(hObject);
    
    %handles.videoPanel.Visible = 'off';
    %handles.measurePanel.Visible = 'off';    
    % toggle on examination panel 
    handles.examinationPanel.Visible = 'on';
    handles.imageDisplayPanel.Visible = 'on';
    handles.patientInfoPanel.Visible = 'on';
    
    kernel = handles.kernelSizeSlider.Value;
    patientID = handles.loggedPatientID;
    examinationDate = ['Examination date: ', date];
    examName = handles.examinationNameEditField.String;
    gain = sprintf('Gain: ISO %d', handles.gainSlider.Value);
    exposure = sprintf('Exposure: %d ms', handles.exposureSlider.Value);
    kernelSizeValue = sprintf('Kernel size: %d x %d px', kernel, kernel);
    
    %handles.patientIDDBLabel.String = handles.patientID;
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
    image3 = handles.measurementData.maxImage;;
    
%     % displayes them in the measurement overview
%     imshow(image1, 'Parent', handles.);
%     imshow(image2, 'Parent', handles.image2);
%     imshow(image3, 'Parent', handles.image3);
    
    thisTimestamp = getTimestamp();
%    if handles.isLogged ==1
        saveImageToFile(patientID,thisTimestamp , image1, 'baseline');
        saveImageToFile(patientID, thisTimestamp, image2, 'min');
        saveImageToFile(patientID,thisTimestamp, image3, 'max')
        %    end 
        
    examinationName = handles.examinationNameEditField.String;
    data = struct('examinationName', examinationName);
    handles.examinationNameEditField.String = '';
    handles.saveExaminationButton.UserData = data;
    guidata(hObject, handles);
end
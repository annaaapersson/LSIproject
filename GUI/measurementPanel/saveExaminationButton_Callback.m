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
    
    image1 = imread(handles.imageName1);
    image2 = imread(handles.imageName2);
    image3 = imread(handles.imageName3);
    
    imshow(image1, 'Parent', handles.image_T0);
    imshow(image2, 'Parent', handles.image_T1);
    imshow(image3, 'Parent', handles.image_T2);
    
    examinationName = handles.examinationNameEditField.String;
    data = struct('examinationName', examinationName);
    handles.examinationNameEditField.String = '';
    handles.saveExaminationButton.UserData = data;
    guidata(hObject, handles);
end
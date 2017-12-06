function [] = saveROIDataToFile(handles, patientID, timestamp)
% Saves ROI data to the ROIData folder

     ROI.Vector1 = handles.plotObject.valuesAllROI1;
     ROI.Vector2 = handles.plotObject.valuesAllROI2;
     ROI.time = handles.plotObject.counter;
     ROI.imageTimes = handles.plotObject.imageTimes;

     save(createFullDestinationROIData(patientID, timestamp), '-struct', 'ROI');
 
 end
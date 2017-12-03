function [] = saveImageToFile(patientID, timestamp, image, imageType)
%% Saves the image to file for the specified patient
% The file path is stored in the measurementDatabase

%% Required input types
% Input 'image' of type .mat
% Input 'patientID', 'timestamp' and 'imageType' of type string
% 'imageType' can be baseline, min, max, ROI1 and ROI2.

%% Save image to file
% Get full destination filename
fullDestinationFileName = createFilename(patientID, timestamp, imageType)
% Write image to full destination filename
imwrite(image, fullDestinationFileName);
end


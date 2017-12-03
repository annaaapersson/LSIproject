function [image] = getImageFromFile(patientID, timestamp, imageType)
% Get specific image from file
%% Required input types
% Input 'patientID', 'timestamp' and 'imageType' of type string
% 'imageType' can be baseline, min, max, ROI1 and ROI2.

fullDestinationFileName = createFilename(patientID, timestamp, imageType)

load fullDestinationFileName;

end


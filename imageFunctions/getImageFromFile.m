function [image] = getImageFromFile(patientID, timestamp, imageType)
% Get specific image from file
%% Required input types
% Input 'patientID', 'timestamp' and 'imageType' of type string
% 'imageType' can be baseline, min, max, ROI1 and ROI2.
addpath(genpath(pwd));

imageFilename = getImageFilename(patientID, timestamp, imageType);

image = imread(imageFilename);

end


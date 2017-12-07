function [time, ROI1, ROI2, imageTimes] = getROIDataFromFile(patientID,...
    timestamp)
%% Gives back the ROI data from a unique measurement
addpath(genpath(pwd));
% Convert timestamp so that it can be used in filename
theTimestamp = [timestamp(1:10),'_', timestamp(12:13),timestamp(15:16),...
    timestamp(18:19)];

% Get file name
filename = [patientID,'_', theTimestamp,'_','ROI','.mat'];
% Take ROIData from the file with filename [filename]:
ROIData = matfile(filename);
%Read the variables from the MAT-file.
time = ROIData.time;
ROI1 = ROIData.Vector1;
ROI2 = ROIData.Vector2;
imageTimes = ROIData.imageTimes;
end


function fullDestinationROIData = createFullDestinationROIData(patientID, timestamp)
%% Returns the filename of the requested image
currentPath = pwd;
%%
storagePath = [currentPath,'\patientImages'];
storagePath = [storagePath,'\ROIData'];
% Convert timestamp so that it can be used in filename
timestamp = [timestamp(1:10),'_', timestamp(12:13),timestamp(15:16),timestamp(18:19)];
% Get file name
filename = [patientID,'_',timestamp,'_','ROI.mat'];
% Get full destination filename
fullDestinationROIData = [storagePath,'\', filename];

end

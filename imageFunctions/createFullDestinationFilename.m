function fullDestinationFileName = createFullDestinationFilename(patientID, timestamp, imageType)
%% Creates the unique image filename, corresponding to that of database
% Expect input (patientID, timestamp, imageType) to be of type string
% 'imageType' can be baseline, min or max
% Store the image as .jpg since it takes much less place than does .mat file

currentPath = pwd;
%%
storagePath = [currentPath,'\patientImages'];

if strcmp(imageType, 'ROI')
    storagePath = [storagePath,'\ROI_Images'];
elseif strcmp(imageType, 'baseline') || strcmp(imageType,'min') ||...
        strcmp(imageType,'max')
    storagePath = [storagePath,'\measurementImages'];
else
    disp('Warning: Uncorrect filepath')
end
% Convert timestamp so that it can be used in filename
timestamp = [timestamp(1:10),'_', timestamp(12:13),timestamp(15:16),timestamp(18:19)];
% Get file name
filename = [patientID,'_',timestamp,'_',imageType,'.jpg'];
% Get full destination filename
fullDestinationFileName = [storagePath,'\', filename];
% Go up to ordinary file
%cd ..;
end

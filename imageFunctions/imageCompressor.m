function [compressedImage, rows, columns] = imageCompressor(inputImage)
% This cfunction compressed the inputImage so that the output
% compressedImage fits into the database
% Put every (kernelSize x kernelSize) pixels together.

kernelSize = 3;

rowCounter = floor(size(inputImage,1)/kernelSize);
colCounter = floor(size(inputImage,2)/kernelSize);

% The empty output image that will be filled
compressedImage = ones(rowCounter,colCounter); 

for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
       currentLocation = inputImage(row:row+kernelSize-1,col:col+kernelSize-1);
       currentLocationMean = sum(sum(currentLocation)) / (kernelSize^2);
       % Put part of image in compressed image
       compressedImage((row+kernelSize-1)/kernelSize,...
           (col+kernelSize-1)/kernelSize ) = currentLocationMean;
    end
end
% Output
%compressedImage;
rows = size(compressedImage,1);
columns = size(compressedImage ,2);
% Show compressed image
% figure(1)
% image(compressedImage);
end


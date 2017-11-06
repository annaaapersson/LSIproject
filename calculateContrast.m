function contrastImage = calculateContrast(kernelSize, lightCorrectedImageInput)
%The function calculates the contrast in segments of the input image by moving a kernel of
%size kernelSize x kernelSize over it. The contrast value of a kernel sized segment
%is transferred to all pixels in the corresponding segment of the
%output image.

%Change datatype to single to avoid reaching max when squaring the values
lightCorrectedImage = single(imread(lightCorrectedImageInput));
%# of times the kernel is moved along rows and columns
rowCounter = floor(size(lightCorrectedImage,1)/kernelSize);
colCounter = floor(size(lightCorrectedImage,2)/kernelSize);

%Highest possible contrast is 1, static subject -> contrast = 1.
%If no contrast calculation is performed the value is automatically 1
%in the output image (areas outside the hand).
contrastImage = ones(rowCounter*kernelSize,colCounter*kernelSize); 

%This threshold has to be investigated to find a suitable value. The value
%must be chosen automatically to adapt to different intensity
%values.
%The threshold is used to speed up the calculation by avoiding static areas
%such as areas outside of the hand and black areas arising from the
%circular optical filter
thresholdForCalculation = 17; %sum(sum(lightCorrectedImage))/(size(lightCorrectedImage,1)*size(lightCorrectedImage,2));

for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
       
        %Calculate mean intensity at current location
       currentLocationMean = sum(sum(lightCorrectedImage(row:row+kernelSize-1,col:col+kernelSize-1)))/kernelSize^2; 
       
       if currentLocationMean > thresholdForCalculation
           currentLocationSquared = lightCorrectedImage(row:row+kernelSize-1,col:col+kernelSize-1).^2;
           
           %Calculate variance at current location X
           %var(X) = E(X^2) - E(X)^2
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location
           
           %Save the contrast values in the new contrast image.
           %Calibration? C = (C-Cmin)/(Cmax-Cmin)
           contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = contrastLocation;%(contrastLocation-0.0356)/(0.3969-0.0356);
       end
    end
end


end


    
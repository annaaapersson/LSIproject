function contrastImage = calculateContrastNewSumMinimize(kernelSize, lightCorrectedImageInput)

lightCorrectedImage = double(imread(lightCorrectedImageInput));

rowCounter = floor(size(lightCorrectedImage,1)/kernelSize);
colCounter = floor(size(lightCorrectedImage,2)/kernelSize);

contrastImage = ones(rowCounter,colCounter); 

thresholdForCalculation = sum(lightCorrectedImage(:))/(size(lightCorrectedImage,1)*size(lightCorrectedImage,2));

for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
       currentLocation = lightCorrectedImage(row:row+kernelSize-1,col:col+kernelSize-1);
       currentLocationMean = sum(currentLocation(:))/kernelSize^2; %mean2(currentLocation);
       
       if currentLocationMean > thresholdForCalculation
           currentLocationSquared = currentLocation.^2;

           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2; %mean2(currentLocationSquared)
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location

           contrastImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = contrastLocation;%(contrastLocation-0.0356)/(0.3969-0.0356);
       end
    end
end


end


    
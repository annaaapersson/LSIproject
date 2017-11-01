function contrastImage = calculateContrast(kernelSize, lightCorrectedImageInput)

lightCorrectedImage = single(imread(lightCorrectedImageInput));
rowCounter = floor(size(lightCorrectedImage,1)/kernelSize);
colCounter = floor(size(lightCorrectedImage,2)/kernelSize);
contrastImage = ones(rowCounter,colCounter);
meanOfImage = sum(sum(lightCorrectedImage))/(size(lightCorrectedImage,1)*size(lightCorrectedImage,2));

for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
        %Calculate mean intensity at current location
       currentLocationMean = sum(sum(lightCorrectedImage(row:row+kernelSize-1,col:col+kernelSize-1)))/kernelSize^2; 
       if currentLocationMean < meanOfImage %Threshold for the areas outside the hand to speed up the calculation
           
       else
           currentLocationSquared = lightCorrectedImage(row:row+kernelSize-1,col:col+kernelSize-1).^2;
           %Calculate variance at current location
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location
           %Save the contrast values in the new contrast image
           contrastImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = contrastLocation;%(contrastLocation-0.0356)/(0.3969-0.0356);
       end
    end
end


end


    
function contrastImage = calculateContrast(kernelSize, lightCorrectedImageInput)

% Define so they exist after if statements
Kmax = 0.2907;
Kmin = 0.0297;
% Calibration values
if kernelSize == 5
    Kmax = 0.2907;
    Kmin = 0.0297;
elseif kernelSize == 7
    Kmax = 0.2954;
    Kmin = 0.0303;
elseif kernelSize == 9
    Kmax = 0.2994;
    Kmin = 0.0307;
end

lightCorrectedImage = double(lightCorrectedImageInput);

rowCounter = floor(size(lightCorrectedImage,1)/kernelSize);
colCounter = floor(size(lightCorrectedImage,2)/kernelSize);

contrastImage = ones(rowCounter,colCounter); 
thresholdForCalculation = sum(lightCorrectedImage(:))/(size(lightCorrectedImage,1)*size(lightCorrectedImage,2));

for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
       currentLocation = lightCorrectedImage(row:row+kernelSize-1,col:col+kernelSize-1);
       currentLocationMean = sum(currentLocation(:))/kernelSize^2;
       
       if currentLocationMean > thresholdForCalculation
           currentLocationSquared = currentLocation.^2;

           varianceLocation = sum(currentLocationSquared(:))/kernelSize^2 - currentLocationMean^2; 
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location

           contrastImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = (contrastLocation-Kmin)/(Kmax-Kmin);
       end
    end
end
contrastImage(contrastImage>1)=1;
contrastImage = -1*contrastImage + max(contrastImage(:));
end

    
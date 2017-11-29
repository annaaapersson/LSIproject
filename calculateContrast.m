function contrastImage = calculateContrast(kernelSize, lightCorrectedImageInput)

%% New contrast values
%exp.time 3ms
% Kmax = 0.167;
% Kmin = 0.0454;

%exp.time 6ms
% Kmax = 0.1459;
% Kmin = 0.0342;

%exp.time 12ms
Kmax = 0.1440;
Kmin = 0.0268;

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
%contrastImage = -1*contrastImage + max(contrastImage(:));
contrastImage = (-1)*contrastImage + 1 ;
%  contrastImage = 1./contrastImage - 1 ;
end

    
clear

laserWhite = single(imread('laser_dark3.jpg'));
kernelSize = 5;
rowCounter = floor(size(laserWhite,1)/kernelSize);
colCounter = floor(size(laserWhite,2)/kernelSize);
contrastImage = ones(rowCounter,colCounter);
meanOfImage = sum(sum(laserWhite))/(size(laserWhite,1)*size(laserWhite,2));
%meanImage = ones(rowCounter,colCounter);


%%
for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
        %Calculate mean intensity at current location
       currentLocationMean = sum(sum(laserWhite(row:row+kernelSize-1,col:col+kernelSize-1)))/kernelSize^2; 
       %meanImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = currentLocationMean;
       if currentLocationMean < meanOfImage %Threshold for the areas outside the hand to speed up the calculation
           
       else
           currentLocationSquared = laserWhite(row:row+kernelSize-1,col:col+kernelSize-1).^2;
           %Calculate variance at current location
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location
           %Save the contrast values in the new contrast image
           contrastImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = contrastLocation;%(contrastLocation-0.0356)/(0.3969-0.0356);
       end
    end
end


%%
figure(1)
testbild = imshow(-1*10*mat2gray(contrastImage) + max(max(mat2gray(contrastImage))), 'Colormap', jet(255));

    
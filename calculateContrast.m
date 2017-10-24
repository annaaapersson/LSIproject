clear

laserWhite = mat2gray(single(imread('laser_only_6.bmp')));
kernelSize = 5;
rowCounter = floor(size(laserWhite,1)/kernelSize);
colCounter = floor(size(laserWhite,2)/kernelSize);
contrastImage = [];
meanImage = [];

%%
for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
       currentLocationMean = sum(sum(laserWhite(row:row+kernelSize-1,col:col+kernelSize-1)))/kernelSize^2;
       meanImage(row:row+kernelSize-1,col:col+kernelSize-1) = currentLocationMean;
       if currentLocationMean < 0.2
           contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = 1;
       else
           currentLocationSquared = laserWhite(row:row+kernelSize-1,col:col+kernelSize-1).^2;
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean;       
           contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = contrastLocation;
       end
    end
end


%%
figure(1)
imshow(8*contrastImage);

figure(3)
imshow(-1*8*contrastImage+max(max(contrastImage)), 'Colormap', jet(255));

    
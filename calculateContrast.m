clear

% -----  Ambient light correction
% ambient_light = imread('nolaser_white_anna.jpg');
% raw_image = imread('laser_white_anna.jpg');

%
laserWhite = mat2gray(single(imread('laser_dark_tofs3.jpg')));
kernelSize = 5;
rowCounter = floor(size(laserWhite,1)/kernelSize);
colCounter = floor(size(laserWhite,2)/kernelSize);
contrastImage = ones(rowCounter,colCounter);
meanImage = ones(rowCounter,colCounter);

%%
for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
        %Calculate mean intensity at current location
       currentLocationMean = sum(sum(laserWhite(row:row+kernelSize-1,col:col+kernelSize-1)))/kernelSize^2; 
       meanImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = currentLocationMean;
       if currentLocationMean < 0.05 %Threshold for the areas outside the hand to speed up the calculation
           
       else
           currentLocationSquared = laserWhite(row:row+kernelSize-1,col:col+kernelSize-1).^2;
           %Calculate variance at current location
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location
           %Save the contrast values in the new contrast image
           contrastImage((row+kernelSize-1)/kernelSize,(col+kernelSize-1)/kernelSize) = (contrastLocation-0.0356)/(0.3969-0.0356);
       end
    end
end

%%
figure(1)
imshow(contrastImage);
% figure(2)
% imshow(finalContrastImage);
%%
%contrastImage = mat2gray(contrastImage);
figure(2)
imshow(-1*contrastImage, 'Colormap', jet(255));

    
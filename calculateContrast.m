clear

% -----  Ambient light correction
% ambient_light = imread('nolaser_white_anna.jpg');
% raw_image = imread('laser_white_anna.jpg');

%
laserWhite = single(imread('laser_dark_per_efter.jpg'));
kernelSize = 5;
rowCounter = floor(size(laserWhite,1)/kernelSize);
colCounter = floor(size(laserWhite,2)/kernelSize);
contrastImage = [];
meanImage = [];

%%
for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
        %Calculate mean intensity at current location
       currentLocationMean = sum(sum(laserWhite(row:row+kernelSize-1,col:col+kernelSize-1)))/kernelSize^2; 
       %meanImage(row:row+kernelSize-1,col:col+kernelSize-1) = currentLocationMean;
       if currentLocationMean < 0.2 %Threshold for the areas outside the hand to speed up the calculation
           contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = 1; %Set the contrast to 1 for these areas
       else
           currentLocationSquared = laserWhite(row:row+kernelSize-1,col:col+kernelSize-1).^2;
           %Calculate variance at current location
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean; %Contrast at current location
           %Save the contrast values in the new contrast image
           contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = (contrastLocation-0.0356)/(0.3969-0.0356);
       end
    end
end
% finalContrastImage=((contrastLocation-0.0356)/(0.3969-0.0356));
%%
figure(1)
imshow(contrastImage);
% figure(2)
% imshow(finalContrastImage);
%%
contrastImage = mat2gray(contrastImage);
figure(2)
imshow(-1*15*contrastImage+max(max(contrastImage)), 'Colormap', jet(255));

    
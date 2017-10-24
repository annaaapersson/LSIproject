clear

laserWhite=imread('laser_only_6.bmp');

kernelSize = 5;
rowCounter = floor(size(laserWhite,1)/kernelSize);
colCounter = floor(size(laserWhite,2)/kernelSize);
contrastImage = [];
varianceImage = [];
meanImage = [];

for row = 1:kernelSize:(rowCounter-1)*kernelSize+1
    for col = 1:kernelSize:(colCounter-1)*kernelSize+1
       currentLocationMean = sum(sum(single(laserWhite(row:row+kernelSize-1,col:col+kernelSize-1))))/kernelSize^2;
       meanImage(row:row+kernelSize-1,col:col+kernelSize-1) = currentLocationMean;
%        if currentLocationMean < 10
%            contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = 0;
%        else
           currentLocationSquared = single(laserWhite(row:row+kernelSize-1,col:col+kernelSize-1)).^2;
           varianceLocation = sum(sum(currentLocationSquared))/kernelSize^2 - currentLocationMean^2;
           varianceImage(row:row+kernelSize-1,col:col+kernelSize-1) = varianceLocation;
           contrastLocation = sqrt(varianceLocation)/currentLocationMean;
       
           contrastImage(row:row+kernelSize-1,col:col+kernelSize-1) = contrastLocation;
%        end
    end
end

%%
figure(5)
imshow(mat2gray(contrastImage));

figure(6)
imshow(mat2gray(varianceImage));

figure(7)
imshow(mat2gray(meanImage));

%%
imageSingle = single(laserWhite);
figure(8)
imshow(mat2gray(imageSingle))
% for i = 1:size(contrastImage,1)
%     contrastImageType(i,:) = typecast(contrastImage(i,:), 'uint64');
% end
% %%
% normContrastImage = 1/max(max(contrastImageType))*contrastImageType;
% 
% imshow(normContrastImage)
    
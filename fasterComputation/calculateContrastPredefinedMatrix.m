clear

%Can be done before computation
% inputMatrix = mat2gray(single(imread('laser_dark_per_efter.jpg')));
% laserWhite=laserWhite2(1005:1010,1005:1010);

load('apperture_1.mat');
inputMatrix = double(apperture_1);

kernelSize = 5;
rowCounter = floor(size(inputMatrix,1)/kernelSize);
colCounter = floor(size(inputMatrix,2)/kernelSize);

% rowCounter = 20;
% colCounter = 20;

inputMatrix=inputMatrix(1:rowCounter*kernelSize,1:colCounter*kernelSize);


contrastImage = zeros(rowCounter,colCounter);
outputMatrixMean = zeros(rowCounter,colCounter);
outputMatrixSquared = zeros(rowCounter,colCounter);

totalDim = size(inputMatrix,1)*size(inputMatrix,2);

%% Create the indexMatrix
indexMatrix5 = zeros(rowCounter*kernelSize,colCounter*kernelSize, 'uint32');
indexAddition = 0;
changeMod = mod(1:size(inputMatrix,2), kernelSize);
for i = 1:1:size(inputMatrix,2)
    
    if changeMod(i) == 0
        indexMatrix5(:,i) = floor([0:1549]/kernelSize) + 1 + indexAddition;
        indexAddition = indexAddition + size(outputMatrixMean,1);
    else
        indexMatrix5(:,i) = floor([0:1549]/kernelSize) + 1 + indexAddition;
    end 
end
%%

for counter = 1:1:totalDim
    outputMatrixMean(indexMatrix5(counter)) = outputMatrixMean(indexMatrix5(counter)) + inputMatrix(counter); 
    outputMatrixSquared(indexMatrix5(counter)) = outputMatrixSquared(indexMatrix5(counter)) + inputMatrix(counter)^2;
end

meanMatrix = (outputMatrixMean/kernelSize).^2;
varianceMatrix = (outputMatrixSquared - meanMatrix)/kernelSize^2;

contrastMatrix = sqrt(varianceMatrix)./meanMatrix;

%%


test = calculateContrastPreMatrix(inputMatrix,kernelSize);

% indices = find(test>0.8*10^(-6));
% test(indices) = 0.0000009;
histogram(test)

figure(2)
indtest = ind2rgb(test, jet);
image(indtest)
clims = [-1*10^(-6), 0];
bilden = imagesc(-1*test, clims);

% bilden = imagesc(-1*test);

% hehe = ind2rgb(test, colormap);
% image(hehe)



%%
% for counter = 1:kernelSize:totalDim
%     outputMatrix(indexMatrix5(counter)) = outputMatrix(indexMatrix5(counter)) ...
%         + sum(laserWhite(counter:counter+kernelSize - 1));   
% end

%%
% figure(1)
% imshow(contrastImage);
% figure(2)
% imshow(finalContrastImage);
%%
%contrastImage = mat2gray(contrastImage);
%  figure(2)
%  imshow(-1*contrastImage, 'Colormap', jet(255));

    
function [contrastMatrix] = calculateContrastPreMatrix(inputMatrix,kernelSize)
%Only created for kernelSize = 5

% To dsiplay Image:
% test = calculateContrastPreMatrix(inputMatrix,kernelSize);
% 
% clims = [-1*10^(-6), 0];
% imagesc(-1*test, clims)
% colormap jet
% colorbar

rowCounter = floor(size(inputMatrix,1)/kernelSize);
colCounter = floor(size(inputMatrix,2)/kernelSize);

inputMatrix=inputMatrix(1:rowCounter*kernelSize,1:colCounter*kernelSize);
outputMatrixMean = zeros(rowCounter,colCounter);
outputMatrixSquared = zeros(rowCounter,colCounter);

totalDim = size(inputMatrix,1)*size(inputMatrix,2);

% Create the indexMatrix
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

for counter = 1:1:totalDim
    outputMatrixMean(indexMatrix5(counter)) = outputMatrixMean(indexMatrix5(counter)) + inputMatrix(counter); 
    outputMatrixSquared(indexMatrix5(counter)) = outputMatrixSquared(indexMatrix5(counter)) + inputMatrix(counter)^2;
end

meanMatrix = (outputMatrixMean/kernelSize).^2;
varianceMatrix = (outputMatrixSquared - meanMatrix)/kernelSize^2;
contrastMatrix = sqrt(varianceMatrix)./meanMatrix;
end


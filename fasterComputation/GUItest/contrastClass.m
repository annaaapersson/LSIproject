classdef contrastClass < handle % might be used
    
    properties
        
        outputMatrixMean
        outputMatrixSquared
        totalDim
        contrastMatrix
        indexMatrix5
    end
    
    methods
        % Constructor
        function object = contrastClass(rowSize, colSize, kernelSize)
            rowCounter = floor(rowSize/kernelSize);
            colCounter = floor(colSize/kernelSize);
            inputMatrix = zeros(rowSize,colSize);
            inputMatrix = inputMatrix(1:rowCounter*kernelSize,1:colCounter*kernelSize);
            
            object.outputMatrixMean = zeros(rowCounter,colCounter);
            object.outputMatrixSquared = zeros(rowCounter,colCounter);
            
            object.totalDim = size(inputMatrix,1)*size(inputMatrix,2);
            
            object.indexMatrix5 = zeros(rowCounter*kernelSize,colCounter*kernelSize, 'uint32');
            indexAddition = 0;
            changeMod = mod(1:size(inputMatrix,2), kernelSize);
            for i = 1:1:size(inputMatrix,2)
                
                if changeMod(i) == 0
                    object.indexMatrix5(:,i) = floor([0:size(inputMatrix,1)-1]/kernelSize) + 1 + indexAddition;
                    indexAddition = indexAddition + size(object.outputMatrixMean,1);
                else
                    object.indexMatrix5(:,i) = floor([0:size(inputMatrix,1)-1]/kernelSize) + 1 + indexAddition;
                end
            end
            
        end
        
        function contrastMatrix = calContrast(object, inputMatrix, kernelSize)
            for counter = 1:1:object.totalDim
                object.outputMatrixMean(object.indexMatrix5(counter)) = object.outputMatrixMean(object.indexMatrix5(counter)) + inputMatrix(counter);
                object.outputMatrixSquared(object.indexMatrix5(counter)) = object.outputMatrixSquared(object.indexMatrix5(counter)) + inputMatrix(counter)^2;
            end
            
            meanMatrix = (object.outputMatrixMean/kernelSize).^2;
            varianceMatrix = (object.outputMatrixSquared - meanMatrix)/kernelSize^2;
            varianceMatrix(varianceMatrix < 0) = 0;
            contrastMatrix = sqrt(varianceMatrix)./meanMatrix;
        end
        

    end
end
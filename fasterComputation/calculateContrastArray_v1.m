clear

laserWhite = mat2gray(single(imread('laser_dark_per_efter.jpg')));

% laserWhite=laserWhite2(1005:1010,1005:1010);


kernelSize = 5;
rowCounter = floor(size(laserWhite,1)/kernelSize);
colCounter = floor(size(laserWhite,2)/kernelSize);

% rowCounter = 20;
% colCounter = 20;

laserWhite=laserWhite(1:rowCounter*kernelSize,1:colCounter*kernelSize);

contrastImage = ones(rowCounter,colCounter);
outputMatrix = zeros(rowCounter,colCounter);

totalDim = size(laserWhite,1)*size(laserWhite,2);


%%
insert = 1; % Where to insert in Output matrix
switchColOutput = 1; % Counter for new row i Output matrix
insertCol = 0;
modulus = size(laserWhite, 1); % Number of rows in Output matrix

modTest = [1 2 3 4 0];

test = 1;
for counter = 1:1:totalDim

    if mod(counter, modulus) == 0 % Start from first row in output Matrix?
%         pos = 'if2'
%         insert
        outputMatrix(insert) = outputMatrix(insert) + laserWhite(counter);
        insert = 1 + insertCol * size(outputMatrix, 1);
        switchColOutput = switchColOutput + 1;
        test = 1;
        
        if mod(switchColOutput,kernelSize + 1) == 0 % Start from next row in output Matrix
            insertCol = insertCol + 1;
            insert = 1 + insertCol * size(outputMatrix, 1);
            test = 1;
        end

    elseif modTest(test) == 0
%         pos = 'if3'
%         insert
        outputMatrix(insert) = outputMatrix(insert) + laserWhite(counter);
        insert = insert + 1;
        test = 1;
    else
%         pos = 'else'
%         insert
        outputMatrix(insert) = outputMatrix(insert) + laserWhite(counter);
        test = test + 1;
    end
end


%%


% figure(1)
% imshow(contrastImage);
% figure(2)
% imshow(finalContrastImage);
%%
%contrastImage = mat2gray(contrastImage);
%  figure(2)
%  imshow(-1*contrastImage, 'Colormap', jet(255));

    
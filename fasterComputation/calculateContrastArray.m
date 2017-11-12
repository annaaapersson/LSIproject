clear

%Can be done before computation

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

insert = 1; % Where to insert in Output matrix
switchColOutput = 1; % Counter for new row i Output matrix
insertCol = 0;
modolusRows = size(laserWhite, 1); % Number of rows in Output matrix

counterModolusRows = mod(1:totalDim, modolusRows);
counterModoKernelsize = mod(1:totalDim,kernelSize);

%%


for counter = 1:1:totalDim

    if counterModolusRows(counter) == 0 % Start from first row in output Matrix?
%         pos = 'if2'
%         insert
        outputMatrix(insert) = outputMatrix(insert) + laserWhite(counter);
        insert = 1 + insertCol * size(outputMatrix, 1);
        switchColOutput = switchColOutput + 1;
        
        if mod(switchColOutput,kernelSize + 1) == 0 % Start from next row in output Matrix
            insertCol = insertCol + 1;
            insert = 1 + insertCol * size(outputMatrix, 1);
        end

    elseif counterModoKernelsize(counter) == 0
%         pos = 'if3'
%         insert
        outputMatrix(insert) = outputMatrix(insert) + laserWhite(counter);
        insert = insert + 1;
    else
%         pos = 'else'
%         insert
        outputMatrix(insert) = outputMatrix(insert) + laserWhite(counter);
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

    
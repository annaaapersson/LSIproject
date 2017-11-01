% Extraxt hand pattern from image

%% Settings
limit_low = 6000;
%% Load image
load('lina_1.mat')
image = lina_1;
%% See hand shape
rows = size(image,1);
columns = size(image,2);
image_mod = image;

for row = 1:1:rows
    for col = 1:1:columns
        if image(row,col) < limit_low
           image_mod(row,col) = 0;
        else
           image_mod(row,col) = 10^7;
        end
    end
end
%% Plot the raw image
imtool(image)
%% Plot the modified image
imtool(image_mod)
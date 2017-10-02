%% Plot pixel values

% Note that the image contain integer values
% load('manan_2.mat')
% image = manan_2;
load('lina_1.mat')
image = lina_1;
%%
nbr_pixels = size(image,1)*size(image,2);
image_vector = reshape(image,[1 nbr_pixels]);
sorted_image_vector = sort(image_vector);
%%
min_pixel = sorted_image_vector(1);
max_pixel = sorted_image_vector(size(image_vector,2));
%%
pixel = 0;
j = 1;
nbr_of_value = 0;
while j < nbr_pixels
    nbr_of_value(pixel + 1) = 0;
    while j < nbr_pixels && sorted_image_vector(j) == pixel
        nbr_of_value(pixel + 1) = nbr_of_value(pixel + 1) + 1;
        j = j+1;
    end
    pixel = pixel + 1;
end

%%
last_val = size(nbr_of_value,2) - 1;
figure(1)
plot(0:1:last_val, nbr_of_value,'LineWidth', 2)
title('Sorted image values')
xlabel('Monochromic pixel value')
ylabel('Number of each pixel')
%% Plot the raw image
imtool(image)

%% If problem with camera, type imaqreset

%% Anna test

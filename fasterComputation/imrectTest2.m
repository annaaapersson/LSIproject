clear all
close all
clc

a=imread('liftingbody.png');
% a = double(a);
% a = a + 100;
% result = -1 + 2.*(a - min(a))./(max(a) - min(a));
% result = a / max(a(:));
figure(1)
 I=imshow(a, 'Colormap', jet(255)); %Makes the image color coded
% I=imshow(a);
drawnow
ROI_main(1:size(a,1),1:size(a,2))=0;
ROI_main=uint8(ROI_main);
for i=1:2
      e = imrect(gca,[]); % Creates the imrect object
      BW = createMask(e,I); % Creates a matrix with ones in the marked region
      ROI = a; % Sets the 
      %Sets all the zero values to none
%        ROI(BW == 0) = []; 
% This becomes the ROI with ones, other is set to zero
      ROI(BW == 0) = 0;
%      This becomes the ROI with the values stored
       ROI_main=(ROI_main .* uint8(~BW));
      mean2(ROI)
end
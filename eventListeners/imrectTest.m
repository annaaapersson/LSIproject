clear all
close all
clc

a=imread('liftingbody.png');
figure(1)
% I=imshow(a, 'Colormap', jet(255));
I=imshow(a);
drawnow
ROI_main(1:size(a,1),1:size(a,2))=0;
ROI_main=uint8(ROI_main);
for i=1:2
    e = imrect(gca,[]);
      BW = createMask(e,I);
      ROI = a;
       ROI(BW == 0) = [];     
%       ROI(BW == 0) = 0;
%       ROI_main=(ROI_main .* uint8(~BW)) + ROI;
%       figure(2)
%       imshow (ROI_main);
%       drawnow
%       figure(1)
      mean2(ROI)
end

mean2(ROI)
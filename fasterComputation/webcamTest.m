clear


cam = webcam(1);
% preview(cam) %Not needed
I = imshow(zeros(10));


img = double(rgb2gray(snapshot(cam)));
img2 = calculateContrastPreMatrix(img,5);
histogram(img2)

%%
while (1)
tic;
img = double(rgb2gray(snapshot(cam)));
img2 = calculateContrastPreMatrix(img,5);
% I.CData = img2;
% imshow(img2)
% drawnow;

colormap(jet(200))
clims = [-1*10^(-3), 0];
bilden = imagesc(-1*img2, clims);
toc
end


% closePreview(cam)
% clear('cam') #stop cam
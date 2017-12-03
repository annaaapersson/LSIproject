function handles = saveImage(handles, t)
%function dedicated to take images from the
% videoStream axes panel, housing the calculated
% perfusion images.
% Returning a 
    F = getframe(handles.videoStream);  %Save     
    image = frame2im(F);
    %a = getframe(handles.videoStream);
    %image = a.cdata;
    %imwrite(indata, 'Image.png');
    %s = size(image);
    %bdata = reshape(image,[],1);
   
    %names={'imageName1', 'imageName2', 'imageName3'};

end


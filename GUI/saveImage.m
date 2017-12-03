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
    imageTimestamp = getTimestamp;
    
    cd ImageArchive  
    if t == '1'
        handles.imageName1 = sprintf('t%s_%s.png',t, date)        
        imwrite(image, handles.imageName1);
    elseif t == '2' 
         handles.imageName2 = sprintf('t%s_%s.png',t,date)
        imwrite(image, handles.imageName2);
    elseif t == '3'
         handles.imageName3 = sprintf('t%s_%s.png',t,date)
        imwrite(image, handles.imageName3);
    end   
    cd ..
end


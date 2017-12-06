function addROI1_Callback(hObject, eventdata, handles, datas)

    handles = guidata(hObject);
    % creates a rectangular of inserted size after initializing them
    % with the apply buttons
    %display(handles.apply11Button);
    %datas11 = handles.apply11Button.UserData;
    %datas12 = handles.apply12Button.UserData;
    
    % Creates a mask around the marked area with ones
    handles.LSIimageWindow.activeImrect = 1;
    handles.startRecordingButton.Enable = 'on';
    handles.stopRecordingButton.Enable = 'on';
    
    %h = imrect(gca, [datas12.x datas12.y datas11.width datas11.height]);
    %display(handles.apply12Button.UserData);
    %display(handles.apply11Button.UserData);
    %display(datas11.height);
    %display(datas12.x);
    
    guidata(hObject, handles);
end
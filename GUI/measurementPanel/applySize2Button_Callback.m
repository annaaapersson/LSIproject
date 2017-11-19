function applySize2Button_Callback(hObject, eventdata)
    
    
    %handles = guidata(hObject);
    h = findobj('Tag','height1Edit');
    display(h.String);   
    
   
    %height1 = str2double(handles.height1Edit.String);
    %width1 = str2double(handles.width1Edit.String);
    
    %data = struct('height', height1, 'width', width1);
    %handles.applySize2Button_Callback.UserData = data;
    
    % guidata(hObject, handles);
    
end
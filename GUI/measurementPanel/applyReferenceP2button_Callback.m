function applyReferenceP2button_Callback(hObject, eventdata)
    
    handles = guidata(hObject);
    %display(handles);
    x = str2double(handles.x2Edit.String);
    y = str2double(handles.y2Edit.String);
    
    data = struct('x', x, 'y', y);
    handles.applyReferenceP2button.UserData = data;
    
    guidata(hObject,handles);
end
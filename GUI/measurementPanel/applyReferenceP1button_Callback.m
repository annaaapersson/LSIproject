function applyReferenceP1button_Callback(hObject, eventdata)
    
    handles = guidata(hObject);
    %display(handles);
    x = str2double(handles.x1Edit.String);
    y = str2double(handles.y1Edit.String);
    
    data = struct('x', x, 'y', y);
    handles.applyReferenceP1button.UserData = data;
    
    guidata(hObject,handles);
    %display(datas.x1);
    %display(datas.y1);
    %display(handles.apply11Button);
end
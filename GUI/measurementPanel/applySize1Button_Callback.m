function applySize1Button_Callback(hObject, eventdata)
    
    
    handles = guidata(hObject);
    %display(handles);
    %datas.height1 =  handles.height1Edit.String;
    %datas.width1 = handles.width1Edit.String;
    height1 = str2double(handles.height1Edit.String);
    width1 = str2double(handles.width1Edit.String);
    
    data = struct('height', height1, 'width', width1);
    handles.applySize1Button_Callback.UserData = data;
    %display(handles.applySize1Button_Callback.UserData.height);
    
    guidata(hObject, handles);
    
end
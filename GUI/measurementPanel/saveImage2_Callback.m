function saveImage2_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles.measurementData.saveMinImage(handles);
    guidata(hObject, handles);
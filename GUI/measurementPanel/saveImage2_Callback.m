function saveImage2_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles = saveImage(handles, '2');
    guidata(hObject, handles);
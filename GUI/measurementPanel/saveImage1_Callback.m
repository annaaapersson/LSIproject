function saveImage1_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles = saveImage(handles, '1');
    guidata(hObject, handles);
end
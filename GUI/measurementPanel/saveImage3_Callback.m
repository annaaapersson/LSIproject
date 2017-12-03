function saveImage3_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles = saveImage(handles, '3');
    guidata(hObject, handles);
end
function saveImage3_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles.measurementData.saveMaxImage(handles);
    guidata(hObject, handles);
end
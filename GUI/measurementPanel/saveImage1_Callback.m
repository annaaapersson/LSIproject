function saveImage1_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles.measurementData.saveBaselineImage(handles);
    guidata(hObject, handles);
end
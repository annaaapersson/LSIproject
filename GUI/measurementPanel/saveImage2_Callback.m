function saveImage2_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles.measurementData.saveMinImage(handles);
    handles.plotObject.imageWasTaken(); % Store timepoint of snaphot
    guidata(hObject, handles);
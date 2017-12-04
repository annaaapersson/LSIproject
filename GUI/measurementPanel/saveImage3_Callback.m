function saveImage3_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles.measurementData.saveMaxImage(handles);
    handles.plotObject.imageWasTaken(); % Store timepoint of snaphot
    guidata(hObject, handles);
end
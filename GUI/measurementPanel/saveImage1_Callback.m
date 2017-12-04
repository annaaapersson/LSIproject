function saveImage1_Callback(hObject, eventdata)
    handles = guidata(hObject);
    hObject.Enable = 'off';
    handles.measurementData.saveBaselineImage(handles);
    handles.plotObject.imageWasTaken(); % Store timepoint of snaphot
    guidata(hObject, handles);
end
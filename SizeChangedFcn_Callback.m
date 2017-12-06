function SizeChangedFcn_Callback(hObject, event)
    handles = guidata(hObject);
    % gets the position in pixel of the table and then uses the width to 
    % scale the column width accordingly
    pixelPosition = getpixelposition(handles.examinationDataTable);
    width = pixelPosition(3);
    handles.examinationDataTable.ColumnWidth =  {width*0.14, width*0.2, width*0.15, width*0.19, width*0.1, width*0.1, width*0.1};
    guidata(hObject, handles);
end
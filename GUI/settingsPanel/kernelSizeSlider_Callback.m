function kernelSizeSlider_Callback(hObject, eventdata, handles, datas)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles = guidata(hObject);
val=round(hObject.Value);
hObject.Value=val;

currentKernelLabel = [num2str(val*2-1) 'x' num2str(val*2-1)]; 
handles.kernelCurrentLabel.String = currentKernelLabel;

guidata(hObject, handles);
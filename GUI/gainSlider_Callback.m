function gainSlider_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gainVector = [50 100 200 400 800 1600];
[~, idx] = min(abs(gainVector - 50*2^hObject.Value));

hObject.Value = log2(gainVector(idx)/50);
function gainSlider_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles = guidata(hObject);

val = round(hObject.Value);
handles.gainCurrentLabel.String = val;

% Set the gain of the camera to the new gain;
global src;
src.Gain = val;
% Updating all the handles
guidata(hObject, handles);
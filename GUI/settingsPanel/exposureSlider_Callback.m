function exposureSlider_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles = guidata(hObject);

previousValue = handles.previousExposureValue;
val=round(hObject.Value); % The value to which the slider is changed

% Limit values of exposureSlider to 3, 6 and 12 milliseconds
if val > 3 && val < 12 && (previousValue ~= 6)
    val = 6;
elseif val > 6 && val <= 12 && (previousValue ~= 12)
    val = 12;
end
% Update previous value
handles.previousValue = val;    
% Update value to what was set
hObject.Value = val;
handles.exposureCurrentLabel.String = val;

guidata(hObject, handles);
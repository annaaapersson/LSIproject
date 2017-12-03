function exposureSlider_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles = guidata(hObject);

previousValue = handles.previousExposureValue;
val=round(hObject.Value); % The value to which the slider is changed

%Get camera
global src;
% Limit values of exposureSlider to 3, 6 and 12 milliseconds
% Also update Gain, Kmin, Kmax according to exposure value
if val > 3 && val < 12 && (previousValue ~= 6)
    val = 6;
    src.Gain = 1;
    % Exposure time 6 ms
    handles.Kmax = 0.1459;
    handles.Kmin = 0.0342;
elseif val > 6 && val <= 12 && (previousValue ~= 12)
    val = 12;
    src.Gain = 0;
    % Exposure time 12ms
    handles.Kmax = 0.1440;
    handles.Kmin = 0.0268;
else
    val = 3;
    src.Gain = 3;
    % Exposure time 3 ms
    handles.Kmax = 0.167;
    handles.Kmin = 0.0454;
end
% Give the camera the new exposure time value
src.Shutter = val;
% Update previous value
%handles.previousValue = val;    
% Update value to what was set
hObject.Value = val;
handles.exposureCurrentLabel.String = val;
handles.previousExposureValue = val;  

guidata(hObject, handles);
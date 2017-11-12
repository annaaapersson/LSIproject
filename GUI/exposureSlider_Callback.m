function exposureSlider_Callback(hObject, event, min, max)
val = hObject.Max - hObject.Value;
val=round(hObject.Value);
hObject.Value=val;
end
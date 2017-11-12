function kernSlider_Callback(hObject, event)
%val = hObject.Max - hObject.Value;
val=round(hObject.Max+1 - hObject.Value);
hObject.Value=val;
end
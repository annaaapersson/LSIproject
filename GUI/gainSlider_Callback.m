function gainSlider_Callback(hObject, event)
    
    val=round(hObject.Max+1-hObject.Value);
    hObject.Value=val;
end
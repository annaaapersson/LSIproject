function returnButton_Callback(hObject, eventdata)
    handles = guidata(hObject);
    
    handles.examinationPanel.Visible = 'off';
    display(handles.kernelSize);
    
    guidata(hObject, handles);

end
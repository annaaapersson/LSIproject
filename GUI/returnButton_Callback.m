function returnButton_Callback(hObject, eventdata)
    handles = guidata(hObject);
    
    handles.examinationPanel.Visible = 'off';
    
    guidata(hObject, handles);

end
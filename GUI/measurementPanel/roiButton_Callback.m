function roiButton_Callback(hObject, eventdata, handles)
%% GUI
% toggle residual panels invisible
handles.patientPanel.Visible = 'off';
handles.startRecordingPanel.Visible = 'off';
handles.savePanel.Visible = 'off';
handles.saveMeasurementPanel.Visible = 'off';

% toggle ROI1 and ROI2 visible
handles.roi1Panel.Visible = 'on';
handles.roi2Panel.Visible = 'on';

% reactivating video stream 
handles.LSIimageWindow.activate(handles);

% h = imrect(gca);
% position = wait(h);
end
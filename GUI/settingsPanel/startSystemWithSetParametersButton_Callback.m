function startSystemWithSetParametersButton_Callback(hObject, eventdata, handles)
%Deactivate image flow
handles.LSIimageWindow.deactivate;
% Take image to test result with new parameters
handles.LSIimageWindow.takeTestImage(handles);
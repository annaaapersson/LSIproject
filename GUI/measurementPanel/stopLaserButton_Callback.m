function stopLaserButton_Callback(hObject, event)
    handles = guidata(hObject);
% stop the laser - call function to do so
try
    handles.laser.stop;
end
end
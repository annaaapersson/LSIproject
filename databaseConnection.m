%% First database connection - a simple start
% Note: needs the database measurementDatabase.
% It might be so that configuration needs to be made upon first connection
% to the measurementDatabase.
clear
clc
conn = database('measurementDatabase','doctorsName','test');
ping(conn);
% Show all patients in the database patient register
showAllPatients = 'SELECT * FROM patient';
patientRegister = select(conn,showAllPatients)
% Show all measurements made for all patients
showAllMeasurements = 'SELECT * FROM measurement';
measurementRegister = select(conn, showAllMeasurements)
% Show all ROIS from all measurements and all patients
showAllROIs = 'SELECT * FROM ROI';
ROIRegister = select(conn, showAllROIs)
% ping(conn)
close(conn)

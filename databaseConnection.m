%% First database connection - a simple start
% Note: needs the database measurementDatabase.
% It might be so that configuration needs to be made upon first connection
% to the measurementDatabase.
clear
clc
conn = database('measurementDatabase','doctorsName','test');
ping(conn);
%% Show all patients in the database patient register
showAllPatients = 'SELECT * FROM patient';
patientRegister = select(conn,showAllPatients)
%% Show all measurements made for all patients
showAllMeasurements = 'SELECT * FROM measurement';
measurementRegister = select(conn, showAllMeasurements)
% Show all ROIS from all measurements and all patients
showAllROIs = 'SELECT * FROM ROI';
ROIRegister = select(conn, showAllROIs)
%% Add patient data
% Add new patient into the register
colnames = {'patient_ID', 'patient_name'};
patientID = '20002020-2020';
patientName = 'Erika Ikka';
data = {patientID, patientName};
data_table = cell2table(data,'VariableNames',colnames)
% Insert the data into the DB
conn = database('measurementDatabase','doctorsName','test');
insert(conn, 'patient', colnames, data_table );
%% Add measurement data
clear
clc
%colnames = {'patient_ID', 'timestamp', 'examination', 'physician', 'measurement_points',...
% 'gain', 'exposure', 'fps', 'kernel_size', 'image_baseline', 'image_min', 'image_max'};
colnames = {'patient_ID', 'timestamp', 'examination', 'physician',... 
    'measurement_points', 'gain', 'exposure', 'fps', 'kernel_size'}; %, 'image_baseline'};

% These are the data we need to get from different places in the code
patientID = '20002020-2020'; % Change 'text' to some source
timestamp = getTimestamp();
examination = 'Left upper hand'; % Change 'text' to some source
physician = 'Dr Oetker'; % Change 'text' to some source
measurement_points = '0 1 2 3 4 5 6 7 8 9 10'; % Change 'text' to some source
gain = 0; % Change 'nbr' to real gain number
exposure = 8; % Change 'nbr' to real exposure number
fps = 1; % Change 'nbr' to real fps number
kernelSize = 5; % Change 'nbr' to real kernel_size number
imageBaseline = manan_2.jpg; % Change to current baseline image
%
data = {patientID, timestamp, examination, physician, measurement_points,...
    gain, exposure, fps, kernelSize}; %, imageBaseline};
data_table = cell2table(data,'VariableNames',colnames);
% Insert the measurement data
conn = database('measurementDatabase','doctorsName','test');
insert(conn, 'measurement', colnames, data_table );
data_inserted_into_the_database = 1
close(conn)
%% ping(conn)
close(conn)

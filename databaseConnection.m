%% First database connection - a simple start
% Note: needs the database measurementDatabase.
% It might be so that configuration needs to be made upon first connection
% to the measurementDatabase.
clear
clc
conn = database('measurementDatabase','doctorsName','test');
%% Show all patients in the database patient register
showAllPatients = 'SELECT * FROM patient';
patientRegister = select(conn,showAllPatients)
%% Show all measurements made for all patients
showAllMeasurements = 'SELECT * FROM measurement';
measurementRegister = select(conn, showAllMeasurements)
%% Show all ROIS from all measurements and all patients
showAllROIs = 'SELECT * FROM ROI';
ROIRegister = select(conn, showAllROIs)
%% Add patient data
% Add new patient into the register
colnames = {'patient_ID', 'patient_name'};
patientID = '000000-8888';
patientName = 'Adam';
data = {patientID, patientName};
data_table = cell2table(data,'VariableNames',colnames)
% Insert the data into the DB
conn = database('measurementDatabase','doctorsName','test');
insert(conn, 'patient', colnames, data_table );
close(conn)
%% Add measurement data
clear
clc
%colnames = {'patient_ID', 'timestamp', 'examination', 'physician', 'measurement_points',...
% 'gain', 'exposure', 'fps', 'kernel_size', 'image_baseline', 'image_min', 'image_max'};
colnames = {'patient_ID', 'timestamp', 'examination', 'physician',... 
    'measurement_points', 'gain', 'exposure', 'kernel_size', 'hello_world'};

% These are the data we need to get from different places in the code
patientID = '000000-0000'; % Change 'text' to some source
timestamp = getTimestamp();
examination = 'Left upper hand'; % Change 'text' to some source
physician = 'Dr Oetker'; % Change 'text' to some source
measurement_points = '0 1 2 3 4 5 6 7 8 9 10'; % Change 'text' to some source
gain = 0; % Change 'nbr' to real gain number
exposure = 8; % Change 'nbr' to real exposure number
kernelSize = 5; % Change 'nbr' to real kernel_size number
%load 'worldsBestGuy.jpg'
%imageBaseline = imread('worldsBestGuy.jpg'); % Change to current baseline image
%
load 'manan_2.mat'
manan = manan_2;
num_el = size(manan,1)*size(manan,2);
mananAsVector = reshape(manan, [1, num_el]);
mananAsDouble = double(mananAsVector);
mananAsStr = num2str(mananAsDouble);
%
data = {patientID, timestamp, examination, physician, measurement_points,...
    gain, exposure, kernelSize , mananAsStr};
data_table = cell2table(data,'VariableNames',colnames);
% Insert the measurement data
conn = database('measurementDatabase','doctorsName','test');
insert(conn, 'measurement', colnames, data_table );
data_inserted_into_the_database = 1
close(conn)
%% Get measurement data
%selectQuery_1 = 'SELECT * FROM measurement WHERE patient_ID = patientID';% AND timestamp LIKE theTimestamp';
selectQuery_1 = ['SELECT * ' ...
    'FROM measurement ' ...
    'WHERE patient_ID = ' mat2str(patientID)...
    ' AND timestamp LIKE ' mat2str(theTimestamp)];
%selectQuery_1 = 'SELECT * FROM patient';
conn = database('measurementDatabase','doctorsName','test');
test = select(conn, selectQuery_1)
close(conn);

%% Insert image into database
% conn = database('measurementDatabase','doctorsName','test');
% load 'worldsBestGuy.jpg';
% baselineImage = imread('worldsBestGuy.jpg');
%%
fastinsert(conn,'measurement','hello_world', mananAsStr)
close(conn)
%% ping(conn)
close(conn)

%% First database connection - a simple start
% Note: needs the database measurementDatabase.
% It might be so that configuration needs to be made upon first connection
% to the measurementDatabase.
clear
clc
conn = database('measurementDatabase','doctorsName','test');
%close(conn)
% insert(conn, 'patient', 'patientID', [1 2; 3 4]);
% close(conn)
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
patientID = '000000-5555';
patientName = 'Fem Fem Fem';
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
    'measurement_points', 'gain', 'exposure', 'kernel_size', 'image_baseline'};% ,...
    %'image_baseline_attachment'};% 'image_min', 'image_max', 'rows', 'columns'};

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
%%
load 'contrastImage.mat'
inputImage = contrastImage;
[compressedImage, rows, columns] = imageCompressor(inputImage);
num_el = rows * columns;

compressedImageAsVector = reshape(compressedImage, [1, num_el]);
compressedImageAsVec = double(compressedImageAsVector);
str = mat2str(compressedImageAsVec);
%mat = char(str);
%com = reshape(compressedImage, [rows, columns]);
%strVec = vect2str(compressedImageAsVec, 'formatstring', '%5.2f');
%compressedImageAsStr = num2str(compressedImageAsVec);
%% Insert data into dB
%load('lina.jpg')
%load('compressedImage.jpg')
%test = '1 2 3 2 1 0';
%%
%A = cell(2,3)
data = {patientID, timestamp, examination, physician, measurement_points,...
    gain, exposure, kernelSize, str}; %'1', '1', '1', rows, columns};
data_table = cell2table(data,'VariableNames',colnames)
done = 1
%% Insert the measurement data
conn = database('measurementDatabase','doctorsName','test');
insert(conn, 'measurement', colnames, data_table );
data_inserted_into_the_database = 1
close(conn)

%% Try another insertion
%load('compressedImage.jpg')
patientID = '000000-9999';
timestamp = '2017-12-01 21:18:02'
selectQuery_1 = ['INSERT INTO measurement (baseline_image) VALUES (1) ' ... 
    'WHERE patient_ID = ' mat2str(patientID)...
    ' AND timestamp LIKE ' mat2str(timestamp)];
conn = database('measurementDatabase','doctorsName','test');
select(conn, selectQuery_1);
close(conn);
%% Get measurement data
%selectQuery_1 = 'SELECT * FROM measurement WHERE patient_ID = patientID';% AND timestamp LIKE theTimestamp';
selectQuery_1 = ['SELECT image_baseline ' ...
    'FROM measurement ' ...
    'WHERE patient_ID = ' mat2str(patientID)...
    ' AND timestamp LIKE ' mat2str(timestamp)];
%selectQuery_1 = 'SELECT * FROM patient';
conn = database('measurementDatabase','doctorsName','test');
image_baseline = select(conn, selectQuery_1)

close(conn);
done_Receiveing_data_from_measurementDatabase = 1
% Reshape from vector to image format again
% NbrRows = table.rows
% NbrColumns = table.columns
% imSize = NbrRows * NbrColumns
%% This does not work for images that are too big
imageFromDB = reshape(cell2mat(table.image_baseline), [table.rows, table.columns]);
% Display the aquired baseline image
figure(2)
image(imageFromDB);

%% Insert image into database
% conn = database('measurementDatabase','doctorsName','test');
% load 'worldsBestGuy.jpg';
% baselineImage = imread('worldsBestGuy.jpg');
%% ping(conn)
close(conn)

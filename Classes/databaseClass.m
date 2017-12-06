classdef databaseClass < handle
    % All the calls to the database occur trough this class
    
    properties
    end
    
    methods
        function addNewPatient(obj, patientID, patientName)
            %% Add patient data
            % Format patient data properly for insertion
            colnames = {'patient_ID', 'patient_name'};
            data = {patientID, patientName};
            data_table = cell2table(data,'VariableNames',colnames);
            % Insert the data into the DB
            conn = database('measurementDatabase','doctorsName','test');
            insert(conn, 'patient', colnames, data_table );
            close(conn)
        end
        
        function [exists, data] = checkIfValidPatientID(obj, patientID)
            %fig = findobj('Tag','fig');
            %handles = guidata(fig)
            selectQuery = sprintf('SELECT * FROM patient WHERE patient_ID = ''%s''', patientID );
            conn = database('measurementDatabase','doctorsName','test');
            data = select(conn, selectQuery);
            close(conn);
            exists = isempty(data);
         end

        function  data = getTableData(obj, patientID)
            selectQuery = sprintf('SELECT patient_ID, timestamp, examination, physician, gain, exposure, kernel_size FROM measurement WHERE patient_ID = ''%s''', patientID );
            conn = database('measurementDatabase','doctorsName','test');
            data = select(conn, selectQuery);
            close(conn);
        end
        
        function sendMeasurementData(obj, handles, timestamp, examination)                
            %% Send unique inforamtion and metadata to database
            colnames = {'patient_ID', 'timestamp', 'examination',...
                'physician', 'gain', 'exposure', 'kernel_size'};
            data = {handles.loggedPatientID, timestamp, examination, ....
                handles.physicianName, handles.gainSlider.Value, handles.exposureSlider.Value,...
                handles.kernelSizeSlider.Value};
            data_table = cell2table(data,'VariableNames',colnames);
            %done = 1
            %% Insert the measurement data
            conn = database('measurementDatabase','doctorsName','test');
            insert(conn, 'measurement', colnames, data_table );
            %data_inserted_into_the_database = 1
            close(conn)
        end
    end
end


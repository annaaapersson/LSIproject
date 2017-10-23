%% First database connection - a simple start
% Note: needs the database testDatabase, but the DB could not be uploaded
% to GIT due to its size. This will be fixed later on. /Lina

conn = database('testDatabase','test','test');
selectquery = 'SELECT * FROM patientRegister';
data = select(conn,selectquery)
% ping(conn)
close(conn)

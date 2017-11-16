function [timestamp] = getTimestamp()
% Returns the system timestamp
% Reformats the system timestamp from matlab into the format required by
% the database

%% Take the system timestamp
rawTimestamp = clock; 
% Convert to correct format
year = string(rawTimestamp(1));
month = string(rawTimestamp(2));
if strlength(month) < 2
    month = '0' + month;
end
day = string(rawTimestamp(3));
if strlength(day) < 2
    day = '0' + day;
end
hour = string(rawTimestamp(4));
if strlength(hour) < 2
    hour = '0' + hour;
end
minute = string(rawTimestamp(5));
if strlength(minute) < 2
    minute = '0' + minute;
end
second = string(round(rawTimestamp(6)));
if strlength(second) < 2
    second = '0' + second;
end
timestampString = year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
%% Output - timestamp that match with measurementDatabase timestamp format
timestamp = char(timestampString);
end


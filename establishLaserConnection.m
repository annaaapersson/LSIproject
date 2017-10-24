function [laser] = establishLaserConnection()
% Establish laser connection
laser = serial('com3');
fopen(laser);
end


function [laser] = establishLaserConnection()
% Establish laser connection
laser = serial('com4');
fopen(laser);
end


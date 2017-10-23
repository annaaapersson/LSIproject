function [] = closeLaserConnection(laser)
% Closes the laser connection
fclose(laser);
delete(laser)
clear laser
end


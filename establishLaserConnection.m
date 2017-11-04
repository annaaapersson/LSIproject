function [laser] = establishLaserConnection()
% Establish to test laser connection
% global laser
% laser = serial('com4');
% fopen(laser);
% fprintf('Laser Connection Established');
% 
% % Lina test
laser = serial('com4');
fprintf('Laser Connection Established');
end


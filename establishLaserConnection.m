<<<<<<< HEAD
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

=======
function [laser] = establishLaserConnection()
% Establish laser connection
% global laser
% laser = serial('com4');
% fopen(laser);
%fprintf('Laser Connection Established');

% Lina test
laser = serial('com4');
%fprintf('Laser Connection Established');

end

>>>>>>> a32ebddbaf2c707e8b3c75d0909cc176490affb9

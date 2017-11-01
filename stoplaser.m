function stoplaser()
% Stop laser connection
global laser
fclose(laser)
delete(laser)
clear laser

end


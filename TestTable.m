%%
examinationDataTable = uitable(...                 
                    'Units','Pixels',...
                    'Position',[0 0 950 428],...                    
                    'FontUnits', 'normalized',...
                    'FontSize', 0.05,...                    
                    'ColumnName', {'Patient ID','Timestamp','Examination Name',...
                    'Physician','Gain','Exposure','Kernel Size'},...
                    'Data',  table2cell(data));...,...
                    ...'ColumnWidth', {143, 190, 190, 142, 95, 95, 95});
                
                
                
%% Get size of the table and use it to adapt the size of the column width 

pixelPosition = getpixelposition(examinationDataTable);
width = pixelPosition(4);

examinationDataTable.ColumnWidth =  {width*0.15, width*0.2, width*0.15, width*0.2, width*0.1, width*0.1, width*0.1};
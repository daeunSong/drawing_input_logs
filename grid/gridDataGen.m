% make grid drawing data
drawing = [];
strokenum = 0;

grid_num = 5;

% vertical lines
for i = 0:grid_num
   x = ones(101,1)*1/grid_num*i; 
   y = 0:0.01:1;
   x = x;
   y = y;
   strokenums = ones(101,1)*strokenum;
   drawing = [drawing; strokenums x y'];
   strokenum = strokenum +1;
end

% horizontal lines
for i = 0:grid_num
    y = ones(101,1)*1/grid_num*i;
    x = 0:0.01:1;
    x = x;
    y = y;
    strokenums = ones(101,1)*strokenum;
    drawing = [drawing; strokenums x' y];
    strokenum = strokenum+1;
end


% write into a text file
fileID = fopen('grid_5.txt','w');

for i = 1 : length(drawing)
    
	drawing_index = drawing(i,1);
    drawing_y = drawing(i,2);
    drawing_x = drawing(i,3);
    
	fprintf(fileID,'%d %f %f \n',drawing_index,drawing_x,drawing_y);
end

fclose(fileID);
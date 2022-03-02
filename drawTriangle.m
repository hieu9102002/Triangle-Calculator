function drawTriangle(a,b,c)

figure;
data = [a; b; c];
x_coor = data(:,1);
y_coor = data(:,2);

patch(x_coor,y_coor,'red'); 

end


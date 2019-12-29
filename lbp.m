
function mlbp_out=lbp(im);
%g1=double(im);
g=rgb2gray(im);
%g=double(g1);
%x = extractLBPFeatures(g);
x1=double(extractLBPFeatures(g,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
x2=double(extractLBPFeatures(g,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
x3=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));
x4=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',4,'Upright',false, 'Interpolation', 'Nearest'));

mlbp_out=horzcat(x1,x2,x3,x4);

return;
end

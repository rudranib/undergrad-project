function all_out=allfunc(im);
%g1=double(im);
g=rgb2gray(im);
%g=double(g1);
%x = extractLBPFeatures(g);
x1=double(extractLBPFeatures(g,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
x2=double(extractLBPFeatures(g,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
x3=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));
x4=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',4,'Upright',false, 'Interpolation', 'Nearest'));

mlbp_out=horzcat(x1,x2,x3,x4);

I=double(im);
R=I(:,:,1);
     G=I(:,:,2);
     B=I(:,:,3);
% Extract Statistical features
% 1] MEAN
meanR=mean2(R);
meanG=mean2(G);
meanB=mean2(B);
% 2] Standard Deviation
stdR=std2(R);
stdG=std2(G);
stdB=std2(B);

cRG=corr2(R,G);
cGB=corr2(G,B);
cBR=corr2(B,R);

e1=(sum(G(:)))^2/(sum(B(:)))^2;
e2=(sum(G(:)))^2/(sum(R(:)))^2;
e3=(sum(B(:)))^2/(sum(R(:)))^2;

%mR=median(R(:));
%xMidVal = (size(R,2)+1) / 2;
%midInds = unique([floor(xMidVal) ceil(xMidVal)]);
%out = R(:,midInds);

 cm_out=[meanR meanG meanB stdR stdG stdB cRG cGB cBR e1 e2 e3];
 
     R1=im(:,:,1);
     G1=im(:,:,2);
     B1=im(:,:,3);
     
L11=double(extractLBPFeatures(R1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L12=double(extractLBPFeatures(R1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L13=double(extractLBPFeatures(R1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L21=double(extractLBPFeatures(G1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L22=double(extractLBPFeatures(G1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L23=double(extractLBPFeatures(G1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L31=double(extractLBPFeatures(B1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L32=double(extractLBPFeatures(B1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L33=double(extractLBPFeatures(B1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));%R2=double(extractLBPFeatures(R,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'))

r=R1./(R1+G1+B1);
g=G1./(R1+G1+B1);
b=B1./(R1+G1+B1);

L41=double(extractLBPFeatures(r,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L42=double(extractLBPFeatures(r,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L43=double(extractLBPFeatures(r,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L51=double(extractLBPFeatures(g,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L52=double(extractLBPFeatures(g,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L53=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

O1=(R1-G1)/sqrt(2);
O2=(R1+G1-2*B1)/sqrt(6);
O3=(R1+G1+B1)/sqrt(3);

L91=double(extractLBPFeatures(O1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L92=double(extractLBPFeatures(O1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L93=double(extractLBPFeatures(O1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L101=double(extractLBPFeatures(O2,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L102=double(extractLBPFeatures(O2,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L103=double(extractLBPFeatures(O2,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

clbp_out=horzcat(L11,L12,L13,L21,L22,L23,L31,L32,L33,L41,L42,L43,L51,L52,L53,L91,L92,L93,L101,L102,L103);
 
 all_out=horzcat(mlbp_out, cm_out, clbp_out);
return;
end

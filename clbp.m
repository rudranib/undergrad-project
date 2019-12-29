function clbp_out=clbp(I);
%I=double(im);

     R=I(:,:,1);
     G=I(:,:,2);
     B=I(:,:,3);
     
L11=double(extractLBPFeatures(R,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L12=double(extractLBPFeatures(R,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L13=double(extractLBPFeatures(R,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L21=double(extractLBPFeatures(G,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L22=double(extractLBPFeatures(G,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L23=double(extractLBPFeatures(G,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L31=double(extractLBPFeatures(B,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L32=double(extractLBPFeatures(B,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L33=double(extractLBPFeatures(B,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));%R2=double(extractLBPFeatures(R,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'))
%G=double(extractLBPFeatures(g,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
%B=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));
%x4=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',4,'Upright',false, 'Interpolation', 'Nearest'));

S=R+G+B;
r=R./S;
g=G./S;
b=B./S;

L41=double(extractLBPFeatures(r,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L42=double(extractLBPFeatures(r,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L43=double(extractLBPFeatures(r,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L51=double(extractLBPFeatures(g,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L52=double(extractLBPFeatures(g,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L53=double(extractLBPFeatures(g,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

%{
meanR=mean2(R);
meanG=mean2(G);
meanB=mean2(B);

stdR=std2(R);
stdG=std2(G);
stdB=std2(B);

R1=(R-meanR)/stdR;
B1=(B-meanB)/stdB;
G1=(G-meanG)/stdG;

L61=double(extractLBPFeatures(R1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L62=double(extractLBPFeatures(R1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L63=double(extractLBPFeatures(R1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L71=double(extractLBPFeatures(G1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L72=double(extractLBPFeatures(G1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L73=double(extractLBPFeatures(G1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L81=double(extractLBPFeatures(B1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L82=double(extractLBPFeatures(B1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L83=double(extractLBPFeatures(B1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

O1=(R-G)/sqrt(2);
O2=(R+G-2*B)/sqrt(6);
O3=(R+G+B)/sqrt(3);

L91=double(extractLBPFeatures(O1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L92=double(extractLBPFeatures(O1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L93=double(extractLBPFeatures(O1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L101=double(extractLBPFeatures(O2,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L102=double(extractLBPFeatures(O2,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L103=double(extractLBPFeatures(O2,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

O11=O1./O3;
O12=O2./O3;

L111=double(extractLBPFeatures(O11,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L112=double(extractLBPFeatures(O11,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L113=double(extractLBPFeatures(O11,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L121=double(extractLBPFeatures(O12,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L122=double(extractLBPFeatures(O12,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L123=double(extractLBPFeatures(O12,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

%H=atan(O1./O2);

%L131=double(extractLBPFeatures(H,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
%L132=double(extractLBPFeatures(H,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
%L133=double(extractLBPFeatures(H,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

%}

%clbp_out=horzcat(L11,L12,L13,L21,L22,L23,L31,L32,L33,L41,L42,L43,L51,L52,L53,L91,L92,L93,L101,L102,L103);
clbp_out=horzcat(L11,L12,L13,L21,L22,L23,L31,L32,L33,L41,L42,L43,L51,L52,L53);

%save('f56.mat','clbp_out');
return;
end



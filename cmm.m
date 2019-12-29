function cm_out=cmm(im);
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

 return;
end
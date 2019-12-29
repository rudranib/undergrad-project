function olbp_out=olbp(I);
%I=double(im);

     R=I(:,:,1);
     G=I(:,:,2);
     B=I(:,:,3);
     
O1=(R-G)/sqrt(2);
O2=(R+G-2*B)/sqrt(6);
O3=(R+G+B)/sqrt(3);

L91=double(extractLBPFeatures(O1,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L92=double(extractLBPFeatures(O1,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L93=double(extractLBPFeatures(O1,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));

L101=double(extractLBPFeatures(O2,'NumNeighbors',8,'Radius',1,'Upright',false, 'Interpolation', 'Nearest'));
L102=double(extractLBPFeatures(O2,'NumNeighbors',16,'Radius',2,'Upright',false, 'Interpolation', 'Nearest'));
L103=double(extractLBPFeatures(O2,'NumNeighbors',24,'Radius',3,'Upright',false, 'Interpolation', 'Nearest'));


olbp_out=horzcat(L91,L92,L93,L101,L102,L103);

%save('f56.mat','clbp_out');
return;
end



function crop_frame=cf(I);
[x, y, z] = size(I); % find the sizes
%rect = [(x/2)-50, (y/2)-50, 99, 99]; %form a rectangle for cropping
%I1=rgb2gray(I);
crop_frame=imcrop(I,[(x/2)-50 (y/2)-50 512 512]);
%{
crop_frame=imcrop(I,[(x/2)-50 (y/2)-50 128 128]);
crop_frame=imcrop(I,[(x/2)-50 (y/2)-50 256 256]);
crop_frame=imcrop(I,[(x/2)-50 (y/2)-50 32 32]);
crop_frame=imcrop(I,[(x/2)-50 (y/2)-50 64 64]);

imshow(I)
imshow(crop_frame)
%}
return;
end
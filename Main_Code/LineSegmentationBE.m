%line segmentation BE Thesis
close all;
clc;
clear all;

%I =im2bw(rgb2gray(imread('D:\COLLEGE\PROJECTS\database\abe\abe.tif')));
%I =im2bw(rgb2gray(imread('30a1.tif')));
%I =im2bw(rgb2gray(imread('img1.jpg')));
I =im2bw(rgb2gray(imread('figure20.jpg')));
figure; 
imshow(I); 
[r c] = size(I); 

m=1;
n=1; 

for k = 1:r 
    fl = 0; 
    for j = 1:c
        if(I(k,j)==0) 
            fl =1;
        end 
    end
    if(fl==0)
        n = n+1;
        if(n>30) 
            r4(m) = k; 
            m = m+1; 
            n=0;
        end
    end
end

 i=1;
 j=i+1;
 flag = 1;
 
 while i <= flag 
        flag=numel(r4);
        figure;
        k=r4(j)-r4(i);
        imshow(imcrop(I,[1 r4(i) c k]));
        i=j;
        j=j+1;
 end
%I1 = imcrop(I,[1 1 793 r4(1)]);
%I2 = imcrop(I,[1 r4(1) 793 r4(2)-r4(1)]); 
% I3 = imcrop(I,[1 r4(2) 793 r4(3)-r4(2)]);
% I4 = imcrop(I,[1 r4(3) 793 r4(4)-r4(3)]); 
% I5 = imcrop(I,[1 r4(4) 793 r4(5)-r4(4)]); 
% figure; 
% imshow(I1);
% figure; 
% imshow(I2);
% figure; 
% imshow(I3);
% figure; 
% imshow(I4); 
% figure; 
% imshow(I5); 
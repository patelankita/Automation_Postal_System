%Line Segmentation
%Pixel Method
clear all;
close all;
clc;
LS = imread('D:\COLLEGE\PROJECTS\database\abe\abe.tif');
%LS = imread('img1.jpg');
[r c] = size(LS);
figure;
imshow(LS);

i1 = imcrop(LS,[1 1 c 100]);
i2 = imcrop(LS,[1 100 c 100]);
i3 = imcrop(LS,[1 200 c 100]);
i4 = imcrop(LS,[1 300 c 100]);
i5 = imcrop(LS,[1 400 c 100]);

figure;
imshow(i1);
imwrite(i1,'D:\COLLEGE\PROJECTS\database\ls\ls1.tif','tif');
figure;
imshow(i2);
imwrite(i2,'D:\COLLEGE\PROJECTS\database\ls\ls2.tif','tif');
figure;
imshow(i3);
imwrite(i3,'D:\COLLEGE\PROJECTS\database\ls\ls3.tif','tif');
figure;
imshow(i4);
imwrite(i4,'D:\COLLEGE\PROJECTS\database\ls\ls4.tif','tif');
figure;
imshow(i5);
imwrite(i5,'D:\COLLEGE\PROJECTS\database\ls\ls5.tif','tif');
        

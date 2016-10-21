%blobAnalysis
close all;
clc;
clear all;

%readImage
%I=imread('D:\COLLEGE\PROJECTS\Database\nn\sperated images\a3.tif');
%I=imread('D:\COLLEGE\PROJECTS\Database\abe\abe.tif');
I=imread('abe.jpg');
%I=imread('1.jpg');
% I=imread('7.jpg');
figure;
imshow(I);

%convert to gray scale image
Igray=rgb2gray(I);
figure;
imshow(Igray);

%convert to binary image
Ibw=im2bw(Igray, graythresh(Igray));
%Ibw=im2bw(Igray);
figure;
imshow(Ibw);

%edge detection
Iedge=edge(uint8(Ibw));
figure;
imshow(Iedge);

%Morphology
%image dilation
se=strel('square',2);
Iedge2 = imdilate(Iedge, se);
figure;
imshow(Iedge2);

%image filling
Ifill = imfill(Iedge2,'holes');
figure;
imshow(Ifill)

%blobAnalysis
[Ilabel num] = bwlabel(Ifill);
disp(num);
Iprops = regionprops(Ilabel);
Ibox = [Iprops.BoundingBox];
Ibox = reshape(Ibox, [4 num]);
sort(Ibox);
figure;
imshow(I);

%plot on object location
hold on;
for cnt = 1:num
    rectangle('position',Ibox(:,cnt),'edgecolor','r');
end

%crop on object location
hold on;
for cnt = 1:num
    Icrop=imcrop(I, Ibox(:,cnt));
    figure;
    imshow(Icrop);
end

%
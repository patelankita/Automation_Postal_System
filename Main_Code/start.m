clear all;
close all;
clc;

a1 = imread('D:\COLLEGE\PROJECTS\Papers\Mehul, rajmohan\Data Base\1a1.jpg');
imshow(a1);
a3 = rgb2gray(a1);
a2 = imcomplement(a3);
newLineSegmentation(a2);
a4= imread('D:\COLLEGE\PROJECTS\Papers\Mehul, rajmohan\Line segmentated images\1.jpg');
wordSegmentation(a4);
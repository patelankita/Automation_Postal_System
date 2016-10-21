%ChainCoding

close all;
clc ;
clear all;

h=fspecial('average',9);
f=im2bw(rgb2gray(imread('10.jpg')));
figure;
imshow(f);

g=imfilter(f,h,'replicate');
figure;
imshow(g);

gB=im2bw(g,0.5);
figure;
imshow(gB);

B=bwboundaries(gB,'noholes');
% figure;
% imshow(B);

d=cellfun('length',B);
% figure;
% imshow(d);

[maxd,k]=max(d);
b=B(k);
% figure;
% imshow(b);

[M N]=size(g);
g=bound2im(b,M,N);

[s,su]=bsubsamp(b,50);
g2=bound2im(s,M,N);

cn=connectpoly(s(:,1),s(:,2));
figure;
imshow(cn);

g3=bound2im(cn,M,N);

c=fchcode(su);


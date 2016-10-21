clear all
close all
clc


imfile='D:\COLLEGE\PROJECTS\Database\nn\sperated images\c3.tif'; 
BW = imread(imfile);
BW = im2bw(rgb2gray(BW));
imshow(imfile);
%  s  = regionprops(BW, 'centroid');
%   centroids = cat(1, s.Centroid);
%    imshow(BW)
%    hold on
%    plot(centroids(:,1), centroids(:,2), 'b*')
%    hold off
%    h1=strel('square',5);
%    BW=imerode(BW,h1);
%    figure;imshow(BW);
%    ar = regionprops(BW);
% %    x = edge(BW,'canny');
%    figure();
% imshow(x)

B = bwboundaries(BW);
  [B,L,N,A] = bwboundaries(BW);
 figure, imshow(BW); hold on;
 colors=['b' 'g' 'r' 'c' 'm' 'y'];
 for k=1:length(B)
     boundary = B{k};
     cidx = mod(k,length(colors))+1;
     plot(boundary(:,2), boundary(:,1),...
          colors(cidx),'LineWidth',2);
     %randomize text position for better visibility
     rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
     col = boundary(rndRow,2); row = boundary(rndRow,1);
     h = text(col+1, row-1, num2str(L(row,col)));
     set(h,'Color',colors(cidx),...
         'FontSize',14,'FontWeight','bold');
 end
 figure; spy(A);   

ch=B{7,1};
cc=ch;
np = size(ch,1); 
p=ch(1:np,2)+ ch(1:np,1)*j; 

N=np; 

[k,n]=meshgrid(0:N-1,0:N-1); 
E=exp(-2*pi*j*k.*n/N); 
a=E*p; 
ra=a; 
ra(11:end-10)=0; 

rp=inv(E)*ra; 

figure; 
plot(real(p),imag(p),'r.',real(rp),imag(rp),'b.');axis ij; 

l = size(ra,1); 
for i = 1:10 
    pp1(i,1) = ra(i); 
end

j = 11;
for i = l-9 : l
    pp1(j,1) = ra(i);
    j = j + 1; 
end 
w=pp1; 

%NeuraLNetworkTraining %
% contour_find.m


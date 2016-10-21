clc;
clear all;
close all;


imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\a1.tif'; 
I = imread (imfile);
I = im2bw(rgb2gray(I));
i1 = I(:);


imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\a2.tif'; 
I = imread (imfile);
I = im2bw(rgb2gray(I));
i2 = I(:);


imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\a3.tif'; 
I = imread (imfile);
I = im2bw(rgb2gray(I));
i3 = I(:);
imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\a4.tif'; 
I = imread (imfile);
I = im2bw(rgb2gray(I));
i4 = I(:);
imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\a5.tif'; 
I = imread (imfile);
I = im2bw(rgb2gray(I));
i5 = I(:);

P = [i1 i2 i3 i4 i5];
clear i1 i2 i3 i4 i5;

PR = real(P); 

PI = imag(P); 

clear P; 

%R(1:3,1:36) = PR(1:3,1:36); 

%R(4:8,1:36) = PR(16:20,1:36); 

%I(1:3,1:36) = PI(1:3,1:36); 

%I(4:8,1:36) = PI(16:20,1:36); 

P = [PR ; PI]; 

clear PR PI; 

pr = minmax(P); 

net = newff(pr,[50 5],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(5); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 50;
net.trainParam.goal = 0 ; % Maximum number of epochs to train. 




%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
%net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
netn = train(net,P,tg); 
 y = sim(netn, P);
save thenet netn; 
save thep P; 

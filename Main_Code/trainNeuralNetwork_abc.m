%trainNeuralNetwork_ab

clc;
clear all;
close all;

load a1.mat;
load a2.mat;
load a3.mat;
load a4.mat;
load a5.mat;

load b1.mat;
load b2.mat;
load b3.mat;
load b4.mat;
load b5.mat;
load b6.mat;

load c1.mat;
load c2.mat;
load c3.mat;
load c4.mat;
load c5.mat;


P = [a1 a2 a3 a4 a5 b1 b2 b3 b4 b5 b6 c1 c2 c3 c4 c5];

clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5 b6 c1 c2 c3 c4 c5;

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

net = newff(pr,[50 16],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(16); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 1000;
net.trainParam.goal = 0 ;  

%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
% net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
net_abc = train(net,P,tg); 
y = sim(net_abc, P);
save thenet_abc net_abc; 
% save thep P; 

%trainNeuralNetwork_gkl.m
%G K L 

clc;
clear all;
close all;

load var_mat_g1.mat;
load var_mat_g2.mat;
load var_mat_g3.mat;
load var_mat_g4.mat;
load var_mat_g5.mat;

load var_mat_k1.mat;
load var_mat_k2.mat;
load var_mat_k3.mat;
load var_mat_k4.mat;
load var_mat_k5.mat;
load var_mat_k6.mat;

load var_mat_l1.mat;
load var_mat_l2.mat;
load var_mat_l3.mat;
load var_mat_l4.mat;
load var_mat_l5.mat;


P = [var_mat_g1 var_mat_g2 var_mat_g3 var_mat_g1 var_mat_g5 var_mat_k1 var_mat_k2 var_mat_k3 var_mat_k4 var_mat_k5 var_mat_k6 var_mat_l1 var_mat_l2 var_mat_l3 var_mat_l4 var_mat_l5 ];

clear var_mat_g1 var_mat_g2 var_mat_g3 var_mat_g4 var_mat_g5 var_mat_k1 var_mat_k2 var_mat_k3 var_mat_k4 var_mat_k5 var_mat_k6 var_mat_l1 var_mat_l2 var_mat_l3 var_mat_l4 var_mat_l5;

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
net.trainParam.epochs = 7000;
net.trainParam.goal = 0 ;  

%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
%net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
net_gkl = train(net,P,tg); 
y = sim(net_gkl, P);
save thenet_gkl net_gkl; 
%save thep P; 

clc;
clear all;
close all;

load var_mat_g1.mat;

load var_mat_k3.mat;

load var_mat_l1.mat;

load var_mat_o1.mat;

load var_mat_q3.mat;

load var_mat_s1.mat;

load var_mat_v1.mat;

load var_mat_w1.mat;

P = [var_mat_g1 var_mat_k3  var_mat_l1  var_mat_o1  var_mat_q3 var_mat_s1 var_mat_v1 var_mat_w1];

clear var_mat_g1 var_mat_k3  var_mat_l1  var_mat_o1  var_mat_q3 var_mat_s1 var_mat_v1 var_mat_w1;

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

net = newff(pr,[50 8],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(8); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 8000;
net.trainParam.goal = 0 ;  

%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
%net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
netn = train(net,P,tg); 
y = sim(netn, P);
save thenet netn; 
save thep P; 

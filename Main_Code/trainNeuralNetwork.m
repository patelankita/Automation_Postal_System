%G K L O S Q V W 

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

load var_mat_o1.mat;
load var_mat_o2.mat;
load var_mat_o3.mat;
load var_mat_o4.mat;
load var_mat_o5.mat;

load var_mat_q1.mat;
load var_mat_q2.mat;
load var_mat_q3.mat;
load var_mat_q4.mat;

load var_mat_s1.mat;
load var_mat_s2.mat;
load var_mat_s3.mat;
load var_mat_s4.mat;
load var_mat_s5.mat;
load var_mat_s6.mat;

load var_mat_v1.mat;
load var_mat_v2.mat;
load var_mat_v3.mat;
load var_mat_v4.mat;
load var_mat_v5.mat;
load var_mat_v6.mat;

load var_mat_w1.mat;
load var_mat_w2.mat;
load var_mat_w3.mat;
load var_mat_w4.mat;
load var_mat_w5.mat;
load var_mat_w6.mat;


P = [var_mat_g1 var_mat_g2 var_mat_g3 var_mat_g4 var_mat_g5 var_mat_k1 var_mat_k2 var_mat_k3 var_mat_k4 var_mat_k5 var_mat_k6 var_mat_l1 var_mat_l2 var_mat_l3 var_mat_l4 var_mat_l5 var_mat_o1 var_mat_o2 var_mat_o3 var_mat_o4 var_mat_o5 var_mat_q1 var_mat_q2 var_mat_q3 var_mat_q4 var_mat_s1 var_mat_s2 var_mat_s3 var_mat_s4 var_mat_s5 var_mat_s6 var_mat_v1 var_mat_v2 var_mat_v3 var_mat_v4 var_mat_v5 var_mat_v6 var_mat_w1 var_mat_w2 var_mat_w3 var_mat_w4 var_mat_w5 var_mat_w6];

clear var_mat_g1 var_mat_g2 var_mat_g3 var_mat_g4 var_mat_g5 var_mat_k1 var_mat_k2 var_mat_k3 var_mat_k4 var_mat_k5 var_mat_k6 var_mat_l1 var_mat_l2 var_mat_l3 var_mat_l4 var_mat_l5 var_mat_o1 var_mat_o2 var_mat_o3 var_mat_o4 var_mat_o5 var_mat_q1 var_mat_q2 var_mat_q3 var_mat_q4 var_mat_s1 var_mat_s2 var_mat_s3 var_mat_s4 var_mat_s5 var_mat_s6 var_mat_v1 var_mat_v2 var_mat_v3 var_mat_v4 var_mat_v5 var_mat_v6 var_mat_w1 var_mat_w2 var_mat_w3 var_mat_w4 var_mat_w5 var_mat_w6;

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

net = newff(pr,[43 43],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(43); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 1230;
net.trainParam.goal = 0 ;  

%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
%net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
netn = train(net,P,tg); 
y = sim(netn, P);
save thenet netn; 
save thep P; 

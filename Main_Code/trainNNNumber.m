%function name trainNNNumber.m
%training Neural Network for Numbers [0-9]

load dft_feature.mat;

P = dft_feature(:,1:430);

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

net = newff(pr,[10 430],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(430); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 1550;
net.trainParam.goal = 0 ;  

%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
% net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
net_num_40_1550 = train(net,P,tg); 
y = sim(net_num_40_1550, P);
save thenet_num_40_1550 net_num_40_1550; 
% save thep P; 

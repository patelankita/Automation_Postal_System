%trainingNN_lowercase_abc

clc;
clear all;
close all;

%a
filenumber = 1;
inputchar = 'a';
index =1;

for i = 1:42
       
    counter = num2str(i);
    filename = strcat('lc_',inputchar, counter);
    inputfilename = strcat(filename,'.mat');
    
    load (inputfilename);
    
    dft_feature_lc (:,index) = tmp1;
    
    filenumber = filenumber+1;
    index = index+3;
    
    clear tmp1;
end
   
%b
filenumber = 2;
inputchar = 'b';
index2 = 2;

for i = 1:42
       
    counter = num2str(i);
    filename = strcat('lc_',inputchar, counter);
    inputfilename = strcat(filename,'.mat');
    
    load (inputfilename);
    
    dft_feature_lc (:,index2) = tmp1;
    
    filenumber = filenumber+1;
    index2 = index2+3;
    clear tmp1;
end

%c
filenumber = 3;
inputchar = 'c';
index3 = 3;
for i = 1:42
       
    counter = num2str(i);
    filename = strcat('lc_',inputchar, counter);
    inputfilename = strcat(filename,'.mat');
    
    load (inputfilename);
    
    dft_feature_lc (:,index3) = tmp1;
    
    filenumber = filenumber+1;
    index3 = index3+3;
    
    clear tmp1;
end

P = dft_feature_lc;

PR = real(P); 

PI = imag(P); 

clear P; 

%R(1:3,1:36) = PR(1:3,1:36); 

%R(4:8,1:36) = PR(16:20,1:36); 

%I(1:3,1:36) = PI(1:3,1:36); 

%I(4:8,1:36) = PI(16:20,1:36); 

P = [PR ; PI];


%clear PR PI; 

pr = minmax(P)

net = newff(pr,[5 126],{'tansig','purelin'},'traingdx'); 
save  nn1 net;

%net=init(net); 

%clear pr; 

tg = eye(126); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 1500;
net.trainParam.goal = 0 ;  

%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
% net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 

net_lc_abc_1500 = train(net,P,tg); 

y = sim(net_lc_abc_1500, P);
save thenet_lc_abc_1500 net_lc_abc_1500; 
% save thep P; 

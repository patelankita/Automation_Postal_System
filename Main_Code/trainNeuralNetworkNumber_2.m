%function name trainNeuralNetworkNumber_2.m
%training Neural Network for Numbers [0-9]

load dft_feature_num2.mat;

P = dft_feature_num2(:,1:100);

PR = real(P); 

PI = imag(P); 

clear P; 

%R(1:3,1:36) = PR(1:3,1:36); 

%R(4:8,1:36) = PR(16:20,1:36); 

%I(1:3,1:36) = PI(1:3,1:36); 

%I(4:8,1:36) = PI(16:20,1:36); 

P = [PR ; PI]; 

clear PR PI; 

pr = minmax(P(:,1:100)); 

net = newff(pr,[20 1],{'tansig' 'purelin'},'trainbfg','learnis'); 

%net=init(net); 

clear pr; 

%tg = eye(100); 
tg = [ 1:100];
% n=10;
% T=[ones(1,n) 2*ones(1,n) 3*ones(1,n) 4*ones(1,n) 5*ones(1,n) 6*ones(1,n) 7*ones(1,n) 8*ones(1,n) 9*ones(1,n) 10*ones(1,n)];
% tg=T;


% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

% net.trainParam.epochs = 7000; % Maximum number of epochs to train. 
net.trainParam.epochs = 5000;
net.trainParam.goal = 0.000001;
net.trainParam.show=NaN;


%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
%net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 

net_num2_2_40_1550 = train(net,P,tg);

y = sim(net_num2_2_40_1550, P);


save thenet_num2_2_40_1550 net_num2_2_40_1550; 
save test1 y;
% save thep P; 

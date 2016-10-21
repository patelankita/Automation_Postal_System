close all;
clear all;
P = [0 1 2 3 4 5 6 7 8 9 10];
T = [0 1 2 3 4 3 2 1 2 3 4];



% Here a network is created with one hidden layer of five neurons. 
net = newff(P,T,5);



% The network is simulated and its output plotted against the targets. 
 Y = sim(net,P);
%  plot(P,T,P,Y,'o')
max = Y(1);
m = 1;
for(i = 2:123)
    if Y(i)>max
        m = i;
        max = Y(i);
    end
end
%  
%  %
% 
% % 
% % 
% % The network is trained for 50 epochs. Again the network's output is plotted. 
% net.trainParam.epochs = 50;
%  net = train(net,P,T);
%  Y = sim(net,P);
% 
%  plot(P,T,P,Y,'o')
%Neural Network Training %
clc;
clear all;

load a1.mat; 
load b1.mat; 
load c1.mat; 
load d1.mat; 
load e1.mat; 
load f1.mat; 
load g1.mat; 
load h1.mat; 
load i1.mat; 
load j1.mat; 
load k1.mat; 
load l1.mat; 
load m1.mat; 
load n1.mat; 
load o1.mat; 
load p1.mat; 
load q1.mat; 
load r1.mat; 
load s1.mat; 
load t1.mat; 
load u1.mat; 
load v1.mat; 
load w1.mat; 
load x1.mat; 
load y1.mat; 
load z1.mat; 
load zn01.mat; 
load zn11.mat; 
load zn21.mat; 
load zn31.mat; 
load zn41.mat; 
load zn51.mat; 
load zn61.mat; 
load zn71.mat; 
load zn81.mat; 
load zn91.mat; 
load a2.mat; 
load b2.mat; 
load c2.mat; 
load d2.mat; 
load e2.mat; 
load f2.mat; 
load g2.mat; 
load h2.mat; 
load i2.mat; 
load j2.mat; 
load k2.mat; 
load l2.mat; 
load m2.mat; 
load n2.mat; 
load o2.mat; 
load p2.mat; 
load q2.mat; 
load r2.mat; 
load s2.mat; 
load t2.mat; 
load u2.mat; 
load v2.mat; 
load w2.mat; 
load x2.mat; 
load y2.mat; 
load z2.mat; 
load zn02.mat; 
load zn12.mat; 
load zn22.mat; 
load zn32.mat; 
load zn42.mat; 
load zn52.mat; 
load zn62.mat; 
load zn72.mat; 
load zn82.mat; 
load zn92.mat; 
load a3.mat; 
load b3.mat; 
load c3.mat; 
load d3.mat; 
load e3.mat; 
load f3.mat; 
load g3.mat; 
load h3.mat; 
load i3.mat; 
load j3.mat; 
load k3.mat; 
load l3.mat; 
load m3.mat; 
load n3.mat; 
load o3.mat; 
load p3.mat; 
load q3.mat; 
load r3.mat; 
load s3.mat; 
load t3.mat; 
load u3.mat; 
load v3.mat; 
load w3.mat; 
load x3.mat; 
load y3.mat; 
load z3.mat; 
load zn03.mat; 
load zn13.mat; 
load zn23.mat; 
load zn33.mat; 
load zn43.mat; 
load zn53.mat; 
load zn63.mat; 
load zn73.mat; 
load zn83.mat; 
load zn93.mat;
load b4.mat; 

load e4.mat; 

load f4.mat; 
load h4.mat; 
load k4.mat; 
load r4.mat; 
load s4.mat; 
load v4.mat; 
load w4.mat; 
load x4.mat; 
load y4.mat; 
load z4.mat; 
load zn34.mat; 
load zn74.mat; 
load zn84.mat; 


P = [a1 b1 c1 d1 e1 f1 g1 h1 i1 j1 k1 l1 m1 n1 o1 p1 q1 r1 s1 t1 u1 v1 w1 x1 y1 z1 zn01 zn11 zn21 zn31 zn41 zn51 zn61 zn81 zn91 a2 b2 c2 d2 e2 f2 g2 h2 i2 j2 k2 l2 m2 n2 o2 p2 q2 r2 s2 t2 u2 v2 w2 x2 y2 z2 zn02 zn12 zn22 zn32 zn42 zn52 zn62 zn82 zn92 a3 b3 c3 d3 e3 f3 g3 h3 i3 j3 k3 l3 m3 n3 o3 p3 q3 r3 s3 t3 u3 v3 w3 x3 y3 z3 zn13 zn23 zn33 zn43 zn53 zn63 zn73 zn83 zn93  b4 e4  f4 h4 k4 r4 s4 v4 w4 x4 y4 z4 zn34 zn74 zn84]; 

clear a1 b1 c1 d1 e1 f1 g1 h1 i1 j1 k1 l1 m1 n1 o1 p1 q1 r1 s1 t1 u1 v1 w1 x1 y1 z1 zn01 zn11 zn21 zn31 zn41 zn51 zn61 zn81 zn91 a2 b2 c2 d2 e2 f2 g2 h2 i2 j2 k2 l2 m2 n2 o2 p2 q2 r2 s2 t2 u2 v2 w2 x2 y2 z2 zn02 zn12 zn22 zn32 zn42 zn52 zn62 zn82 zn92 a3 b3 c3 d3 e3 f3 g3 h3 i3 j3 k3 l3 m3 n3 o3 p3 q3 r3 s3 t3 u3 v3 w3 x3 y3 z3 zn13 zn23 zn33 zn43 zn53 zn63 zn73 zn83 zn93 b4 e4  f4 h4 k4 r4 s4 v4 w4 x4 y4 z4 zn34 zn74 zn84; 

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

net = newff(pr,[2000 174],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(177); 

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

save thenet netn; 
save thep P; 
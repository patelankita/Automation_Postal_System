%CharacterRecognition %
%Chain coding and DFT Representation of Samples %
close all;
clear all;
r1=0;
c1=2;
d=0;

imfile='d:\college\projects\database\db\bw\c2.tif'; 

tmp=imread(imfile); 
figure;
imshow(tmp);

tmp=imresize(tmp,[128,128]); 
figure;
imshow(tmp);

sub_im=zeros(size(tmp)+[2 2]); 

sub_im(2:end-1,2:end-1)=tmp; 
figure;
imshow(sub_im);

SE=ones(1,1); 

sub_im=imerode(sub_im,SE); %earlier it was only erode%
figure;
imshow(sub_im);

sub_im=double(imdilate(sub_im,SE)); %dilate%
figure;
imshow(sub_im);

ct_im=zeros(size(sub_im)); 

for m=2:size(sub_im,1)-1 
    for n=2:size(sub_im,2)-1 
        if sub_im(m,n)==1 
            tmp=sub_im(m-1,n)+sub_im(m+1,n)+sub_im(m,n-1)+sub_im(m,n+1); 
            if tmp~=4 
                ct_im(m,n)=1; 
            end 
        end 
    end 
end 

figure; 
imshow(ct_im); 

im = ct_im; 
[r c] = size(im); 
fl = 0; 

% To determine starting pixel (r1,c1) 
%1 = white
%0 = black
for i = 1:r 
    for ii = 1:c
        if im(i,ii) == 1 
            r1 = i; 
            c1 = ii; 
            fl = 1; 
            return;
        end 
    end 
    if fl ==1 
        return;
    end 
end 
cc(1,1:2) = [r1,c1]; 
fr = r1; 
fc = c1; 

%disp('bottom left'); 
%im(r1+1,c1-1) 
%disp('bottom'); 
%im(r1+1,c1) 
if im(r1+1,c1-1) == 1 
    r1 = r1+1; 
    c1 = c1-1; 
    cc(2,1:2) = [r1,c1]; 
    d = 5; 
else 
    r1 = r1 + 1; 
    cc(2,1:2) = [r1,c1]; 
    d=6; 
end 

i=2; 
while(1)
    if(r1 == fr) 
        if(c1 == fc) 
            return;
        end
        
    end 
    
    i = i+1; 
    switch d 
        case 0 
            [cc,d,r1,c1] = zero(r1,c1,cc,im,i); 
            
        case 1 
            [cc,d,r1,c1] = one(r1,c1,cc,im,i); 
            
        case 2 
            [cc,d,r1,c1] = two(r1,c1,cc,im,i); 
            
        case 3 
            [cc,d,r1,c1] = three(r1,c1,cc,im,i); 
            
        case 4 
            [cc,d,r1,c1] = four(r1,c1,cc,im,i); 
            
        case 5 
            [cc,d,r1,c1] = five(r1,c1,cc,im,i); 
            
        case 6 
            [cc,d,r1,c1] = six(r1,c1,cc,im,i); 
            
        case 7 
            [cc,d,r1,c1] = seven(r1,c1,cc,im,i); 
            
    end 
end 

np = size(cc,1); 

for l = 1:np-1 
    ch(l,1:2) = cc(l,1:2); 
end 

np = size(ch,1); 
p=ch(1:np,2)+ ch(1:np,1)*j; 

N=np; 

[k,n]=meshgrid(0:N-1,0:N-1); 
E=exp(-2*pi*j*k.*n/N); 
a=E*p; 
ra=a; 
ra(11:end-10)=0; 

rp=inv(E)*ra; 

figure; 
plot(real(p),imag(p),'r.',real(rp),imag(rp),'b.');axis ij; 

l = size(ra,1); 
for i = 1:10 
    pp1(i,1) = ra(i); 
end

j = 11;
for i = l-9 : l
    pp1(j,1) = ra(i);
    j = j + 1; 
end 
w=pp1; 

%Neural Network Training %

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


P = [a1 b1 c1 d1 e1 f1 g1 h1 i1 j1 k1 l1 m1 n1 o1 p1 q1 r1 s1 t1 u1 v1 w1 x1 y1 z1 zn01 zn11 zn21 zn31 zn41 zn51 zn61 zn71 zn81 zn91 a2 b2 c2 d2 e2 f2 g2 h2 i2 j2 k2 l2 m2 n2 o2 p2 q2 r2 s2 t2 u2 v2 w2 x2 y2 z2 zn02 zn12 zn22 zn32 zn42 zn52 zn62 zn72 zn82 zn92 a3 b3 c3 d3 e3 f3 g3 h3 i3 j3 k3 l3 m3 n3 o3 p3 q3 r3 s3 t3 u3 v3 w3 x3 y3 z3 zn03 zn13 zn23 zn33 zn43 zn53 zn63 zn73 zn83 zn93  b4 e4  f4 h4 k4 r4 s4 v4 w4 x4 y4 z4 zn34 zn74 zn84]; 

clear a1 b1 c1 d1 e1 f1 g1 h1 i1 j1 k1 l1 m1 n1 o1 p1 q1 r1 s1 t1 u1 v1 w1 x1 y1 z1 zn01 zn11 zn21 zn31 zn41 zn51 zn61 zn71 zn81 zn91 a2 b2 c2 d2 e2 f2 g2 h2 i2 j2 k2 l2 m2 n2 o2 p2 q2 r2 s2 t2 u2 v2 w2 x2 y2 z2 zn02 zn12 zn22 zn32 zn42 zn52 zn62 zn72 zn82 zn92 a3 b3 c3 d3 e3 f3 g3 h3 i3 j3 k3 l3 m3 n3 o3 p3 q3 r3 s3 t3 u3 v3 w3 x3 y3 z3 zn03 zn13 zn23 zn33 zn43 zn53 zn63 zn73 zn83 zn93 b4 e4  f4 h4 k4 r4 s4 v4 w4 x4 y4 z4 zn34 zn74 zn84; 

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

net = newff(pr,[2000 177],{'tansig','tansig'},'traingdx'); 

%net=init(net); 

clear pr; 

tg = eye(177); 

% net.adaptParam.passes = 200; 

% [net,no,ne]=adapt(net,P,tg); 

%net.trainParam.epochs = 7000; % Maximum number of epochs to train. 

net.trainParam.goal = 0 ; % Maximum number of epochs to train. 




%net.trainParam.lr = 0.05; 
%net.trainParam.mc = 0.9; 
%net.trainParam.max_perf_inc = 1.04; 
net.trainParam.min_grad = 1e-18; 
netn = train(net,P,tg); 
save thenet netn; 
save thep P; 

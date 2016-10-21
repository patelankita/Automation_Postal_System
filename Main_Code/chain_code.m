%CharacterRecognition %
%Chain coding and DFT Representation of Samples %
close all;
clear all;
r1=0;
c1=2;
d=0;

% imfile='d:\college\projects\database\db\bw\c3.tif'; 
imfile='D:\COLLEGE\PROJECTS\Database\nn\sperated images\c3.tif';
tmp=imread(imfile); 
figure;
imshow(tmp);

% tmp=imresize(tmp,[128,128]); 
figure;
imshow(tmp);

sub_im=imresize(tmp,[128,128]); 
%  sub_im=zeros(size(tmp)+[2 2]); 
% 

% sub_im(2:end-1,2:end-1)=tmp; 
%  figure;
%  imshow(sub_im);
% 
%  SE=ones(1,1);
%  SE = [0 1 0 ; 1 1 1; 0 1 0];
% % 
% %  sub_im=imerode(sub_im,SE); %earlier it was only erode%
% %  figure;
% %  imshow(sub_im);
% % % 
%  sub_im=double(imdilate(sub_im,SE)); %dilate%
%  figure;
%  imshow(sub_im);

ct_im=zeros(size(sub_im)); 
% ct_im=zeros(size(tmp)); 

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

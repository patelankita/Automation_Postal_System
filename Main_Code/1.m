%Image Denoising and Binarization 
imfile = 'd:\college\projects\database\3.jpg'; 
I = imread (imfile);
figure;
imshow(I);

% De-noising 
H = fspecial ('average', 2); 
grayImage = rgb2gray(I);
AI = filter2 (H,grayImage); 
figure;
imshow(AI);

% Binarization 
th = 0.35; 
BI = im2bw (grayImage, th); 
figure;
imshow (BI);


%Address Block Location 
% Low pass filter with 20x20 mask 
h = ones (20); 
LI = filter2 (h, BI); 
LI = LI/350; 
% Re-Binarization 
BI = im2bw (LI, 1.0); 
[r c] = size (BI); 
fl = 0; 
figure;
imshow (BI);
imwrite(BI,'D:\COLLEGE\PROJECTS\database\abl\rb.tif','tif');


%Redundancy Correction 
% Remove redundant patches in corners 
I = imread ('D:\COLLEGE\PROJECTS\database\abl\rb.tif'); 
[r c] = size (I); 
figure; 

imshow (I);
%left croping
for i = 1 : 200 
    for j = 1:1230
        k = 1200-i; 
        I(j,i) = 1; 
        I(j,k) = 1; 
    end 
end 
%imshow(I);
%Top Croping
for i = 1 : 30 
    for j = 1:1200 
        k = 1230-i; 
        I(i,j) = 1; 
        I(k,j) = 1; 
    end 
end 
%imshow(I);
%Bottom Croping
for k = 550:1230
    for j = 1:1200
        I(k,j) = 1;
    end
end
%imshow(I);
%Right Croping
for i = 1 : 30
    for j =1:20 
        I(i,j)=1; 
        I(1200-i,j)=1; 
        I(i, 1200-j)=1; 
        I(1200-i,1200-j)=1;
     end 
end 
figure; 
imshow(I);
imwrite(I,'D:\COLLEGE\PROJECTS\database\rc\rc.tif','tif');


%Address Block Extraction 
I = imread('D:\COLLEGE\PROJECTS\database\rc\rc.tif'); 
figure; 
imshow(I); 
[r c] = size(I); 
r2=0;c2=0;r1=r;c1=c; 

for i = 1:r 
    for j = 1:c 
        if(I(i,j)== 0) 
            if(i<r1) 
                r1 = i; 
            end 
            if(j<c1) 
                c1 = j; 
            end 
            if(i>r2)
                r2 = i; 
            end 
            if(j>c2)
                c2 = j; 
            end 
        end 
    end 
end 

J = imcrop(I,[c1 r1 c2-c1 r2-r1]); 
figure; 
imshow(J); 
imwrite(J,'D:\COLLEGE\PROJECTS\database\rc_crop_image\rc_crop_image.tif','tif');

for i = r1:r2 
    for j = c1:c2 
        I(i,j)=0; 
    end 
end 

figure; 
imshow(I); 
imwrite(I,'D:\COLLEGE\PROJECTS\database\rc_box\rc_box.tif','tif');

P = imread('D:\COLLEGE\PROJECTS\database\2.jpg'); 
E = imcrop(P,[c1 r1 c2-c1 r2-r1]); 
figure; 
imshow(E);
imwrite(E,'D:\COLLEGE\PROJECTS\database\abe\abe.tif','tif');


%Underline Removal 
I = imread('D:\COLLEGE\PROJECTS\database\abe\abe.tif'); 
figure;
imshow(I); 
[r c] = size(I); 
n=0; 
for i = 2:r 
    fl = 1; 
    for j = 1:c 
        if I(i,j) == 1 
            fl = 0; 
        break; 
        end
    end
    if fl == 1 
        for k = 1:c 
            if I(i-1,k) == 1 
                I(i,k) = 1; 
            end 
            %I(i,1:end) = 1; 
            %n = n+1; 
        end 
    end 
end 

figure; 
imshow(I);
%n = n+1; 
%n = n/3 
%for i = 1:c 
%   for j = n+1:r-n 
%       if I(j,i) == 1 
%           if I(j-n,i) == 0 
%               if I(j+n,i) == 0 
%                   I(j,i) = 0; 
%               end 
%           end 
%        end 
%    end 
%end 
%figure; 
%imshow(I);
imwrite(E,'D:\COLLEGE\PROJECTS\database\imgrem\imgrem.tif','tif');


%Line and Word separation 
I = imread('D:\COLLEGE\PROJECTS\database\abe\abe.tif'); 
figure; 
imshow(I);
GI = rgb2gray(I);
figure;
imshow(GI);
BWI = im2bw(GI);
figure;
imshow(BWI);
CI = imcomplement(BWI);
figure;
imshow(CI);
lineSegmentation(CI);

[r c] = size(I); 
n=0;m=1;n=1; 

for i = 1:r 
    fl = 0; 
    for j = 1:c
        if(I(i,j)==0) 
            fl =1;
        end 
    end 
    if(fl==0)
        n = n+1;
        if(n>20) 
            r4(m)= i; 
            m = m+1; 
            n=0;
        end 
    end 
end 
I1 = imcrop(I,[1 1 500 r4(1)]); 
I2 = imcrop(I,[1 r4(1) 500 r4(2)-r4(1)]); 
I3 = imcrop(I,[1 r4(2) 500 146-r4(2)]); 
figure; 
imshow(I1);
figure; 
imshow(I2);
figure; 
imshow(I3); 

% Word Separation 
I = imread('c:\desti\ls.tif'); 
figure;imshow(I); 
[r c] = size(I); 
n = 0;m = 1; 
for j = 1:c


 fl = 0; 
for i = 1:r 
if(I(i,j)==0) 
fl = 1;


 end 
end 
if(fl==0)


 n = n+1;

 if(n>21) 
c4(m)=j; 
n=0; 
m = m+1;


 end 

 end 
end 
m = m-1; 


figure; 
imshow( imcrop(I,[1,1,c4(1),r])); 
for i = 2:m

 figure;imshow(imcrop(I,[c4(i-1),1,c4(i)-c4(i-1),r])); 
end 
figure; 
imshow( imcrop(I,[c4(m),1,c-c4(m),r])); 


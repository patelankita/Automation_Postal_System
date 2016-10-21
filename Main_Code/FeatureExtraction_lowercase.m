%FeatureExtraction_lowercase.m
%Chain coding and DFT Representation of Samples 
% dft_feature = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];  save dft_feature.mat dft_feature;

filenumber = 1;
inputchar = 'c';

for i = 1:42
    
    clear cc ch p;
    
    counter = num2str(filenumber);
    filename = strcat(inputchar, counter);
    inputfilename = strcat(filename,'.jpg');
    
    r1=0;
    c1=2;
    d=0;
 
%        load m.mat;
%        load vname.mat;
%        load dft_feature.mat;
      
%  imfile='d:\college\projects\database\db\bw\c2.tif'; 
%  imfile= '10.jpg';
%  imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\l1.tif';
%  TESTING for image s1


    path = 'D:\COLLEGE\PROJECTS\Database\db_1\lowercase\';
    imfile = strcat(path, inputfilename);

    tmp=imread(imfile); 
%       figure;%figure 1
%       imshow(tmp);

    tmp=imresize(tmp,[128,128]); 
%     figure;%figure 2
%     imshow(tmp);

    %convert to gray scale image
    Igray=rgb2gray(tmp);
%     figure;%figure 3
%    imshow(Igray);
    
    %Denoised
%     Denoise=medfilt2(Igray, [1 1]);
    
    %convert to binary image
    %Ibw=im2bw(Denoise, graythresh(Igray));
    Ibw=im2bw(Igray);
%     figure;%figure 4
%     imshow(Ibw);

    %edge detection
    Iedge=edge(uint8(Ibw));
%      figure;%figure 5
%      imshow(Iedge);
    
    %image dilation
    se=strel('square',4);
    %se = [0 1 0; 1 1 1; 0 1 0];
    Iedge2 = imdilate(Iedge, se);
%      figure;%figure 6
%      imshow(Iedge2);
    

    %image filling
    Ifill = imfill(Iedge2,'holes');
%      figure;%figure 7
%      imshow(Ifill);

    %Image Perimeter
    im = bwperim(Ifill, 8);
%      figure;%figure 8
%      imshow(im);

    im = padarray(im,[1 1]);
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
                break
            end 
        end 
        if fl == 1 
            break
        end 
    end 
    cc(1,1:2) = [r1,c1]; 
    fr = r1; 
    fc = c1; 

    %disp('bottom left'); 
    %im(r1+1,c1-1) 
    %disp('bottom'); 
    %im(r1+1,c1) 
    % if r1<128
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
%     end

i=2; 
while(1)
    if(r1 == fr) 
        if(c1 == fc) 
            break;
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

p=complex(ch(1:np,2),ch(1:np,1));

N=np; 

fft_p = fft(p);

ra = real(fft_p);
fft_p(20:end-20)=0;
rp = ifft(fft_p);
%  figure; %figure 9
%  plot(real(p),imag(p),'r.',real(rp),imag(rp),'b.');axis ij; 

tmp1 = fft_p(1:20);
tmp1(21:40) = fft_p(end-19:end);

%for saving all the features in a single array
% dft_feature(:,filenumber) = tmp1;
% save dft_feature.mat dft_feature;

%for saving the features in seprate images
% filename_output = strcat(m{1,2}{filenumber,1},'.mat');
filename_output = strcat ('lc_',filename, '.mat');
%save(filename_output,dft_feature(:,filenumber));
save(filename_output, 'tmp1');

filenumber = filenumber+1;

%   tmp1 = fft_p(1:20);
%   tmp1(21:20) = fft_p(end-19:end);

   end

%  num1_0_1 = tmp1;
%  save 1num0.mat num1_0_1;

% save(m{1,2}{i,1},
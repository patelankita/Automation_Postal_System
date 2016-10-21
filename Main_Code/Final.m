%ImageRead.m
%Image Denoising and Binarization 
imfile = 'd:\college\projects\database\3.jpg'; 
I = imread (imfile);
figure;
imshow(I);


%DeNoise.m
% De-noising 
H = fspecial ('average', 9); 
grayImage = rgb2gray(I);
AI = filter2 (H,grayImage); 
g = imfilter(AI, H, 'replicate');

% I =imread('D:\COLLEGE\PROJECTS\Database\db_1\numbers\3num7.jpg');
% J = rgb2gray(I);
% K = filter2(fspecial('average',6),J)/255;
% imshow(K);


%Binarization.m
% Binarization 
th = 0.35; 
BI = im2bw (grayImage, th); 
figure;
imshow (BI);


%AddressBlockLocation.m
%Address Block Location 
% Low pass filter with 20x20 mask 
h = ones (20); 
LI = filter2 (h, BI); 
LI = LI/350; 
figure;
imshow(LI);

% Re-Binarization 
BI = im2bw (LI, 1.0); 
[r c] = size (BI); 
fl = 0; 
figure;
imshow (BI);
imwrite(BI,'D:\COLLEGE\PROJECTS\database\abl\rb.tif','tif');


%RedundancyCorrection.m
%Redundancy Correction 
% Remove redundant patches in corners 
I = imread ('D:\COLLEGE\PROJECTS\database\abl\rb.tif'); 
[r c] = size (I); 
figure; 
imshow (I);

%Top Crop
for i = 1:150
	for j=1:2564
		I(i,j) = 1;
	end
end
figure;
imshow(I);

%Bottom Crop
for i = 700:1224
	for j=1:2564
		I(i,j) = 1;
	end
end
figure;
imshow(I);

%Left Crop
for i = 1:1224
	for j=1:880
		I(i,j) = 1;
	end
end
figure;
imshow(I);

%Right Crop
for i = 1:1224
	for j=1600:2564
		I(i,j) = 1;
	end
end
figure;
imshow(I);
imwrite(I,'D:\COLLEGE\PROJECTS\database\rc\rc.tif','tif');


%AddressBLockExtraction.m
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

P = imread('D:\COLLEGE\PROJECTS\database\3.jpg'); 
E = imcrop(P,[c1 r1 c2-c1 r2-r1]); 
figure; 
imshow(E);
imwrite(E,'D:\COLLEGE\PROJECTS\database\abe\abe.tif','tif');


%LineSegmentationHistogramMethod.m 
% LINESEGMENTATION This function takes a black and white image and separates lines by creating 
% horizontal cuts. This will not work if the lines have a large skew

    im = imread('D:\COLLEGE\PROJECTS\Database\abe\abe.tif');
    %im = imread('30a1.tif');
    bw = imcomplement(im2bw(rgb2gray(im)));
    figure;
    imshow(bw);

    % CONSTANT DECLARATIONS:
    PEAK_DELTA_FACTOR = 2;
    THRESHOLD = 1;
    HEIGHT = 100;

    % Transform the image in black and white
    %bw = im2bw(im);
    
    % Generate a histogram
    bw_trans = (bw(:,2:end) - bw(:,1:end-1)) ~= 0;
    im_hist = sum(bw_trans,2);
    
    % Smooth the histogram with a 1-D median filter
    %im_hist = medfilt1(im_hist);
    

    % Find minima in histogram
    [max_peaks, min_peaks] = peakdet(im_hist, floor(max(im_hist)/PEAK_DELTA_FACTOR));

    % Plot the histogram
    figure; area(im_hist);
    hold on; 
    plot(min_peaks(:,1), min_peaks(:,2), 'r*');
    h = legend('Histogram of lines', 'Significant Minima');
    title('Vertical Histogram');

    % Plot the file with horizontal cuts
    x = 1:1:size(im,2);
    figure;
    imshow(im,[]);
    
    hold on;
    plot(x, repmat(min_peaks(:,1), [1, size(im,2)]), '-r');
    title('Original text segmented in lines');
    
    
    disp(min_peaks);
    cut_points = [min_peaks(:,1); size(im,1)];
    disp(cut_points);
    
    prev = ones(size(min_peaks,1),1);
    
    % Loop over the lines
    size_cut_points = size(cut_points,1);
    for i = 1:size_cut_points    
        if i ~= 1
            prev(i) = cut_points(i-1);
        end
        
        % Extracted segment
        current_segm = bw(prev(i):cut_points(i),:);
        %disp(cut_points(i));
        % We eliminate an eventually white part
        bw_trans = (current_segm(:,2:end) - current_segm(:,1:end-1)) ~= 0;
        segm_hist = sum(bw_trans,2) ;
        segm_logical_hist = segm_hist > THRESHOLD;
        points = find(segm_logical_hist);
        
        %disp(points(i));
        ascender_cut_point = points(1)-1;
        if ascender_cut_point == 0 
            ascender_cut_point = 1;
        end
        
        descender_cut_point = points(end) + i;
        
        %if descender_cut_point >= 1;
        %    descender_cut_point = 0;
        %end
        
        % New Y coordinates 
        startY = prev(i) + ascender_cut_point;
        eY = prev(i) + descender_cut_point - i - 1;
        disp([ startY, ascender_cut_point, eY ,descender_cut_point]);      
        % Output of the function
        %lines(i).originalImage = im(startY:eY, :, :);
        %lines(i).bwImage = bw(startY:eY, :);
        %lines(i).startY = startY;
        %lines(i).eY = eY;
        
        if eY <= HEIGHT
%             a1 = imcrop(bw, [0 startY size(im, 1) HEIGHT]);
              a1 = bw(startY:HEIGHT,:);  
            %figure(i);
           %imshow(a1);
        else
%             a1 = imcrop(bw, [0 startY size(im,1) eY]);
%             a1 = imcrop(bw, [0 prev(i) size(im,1) cut_points(i)]);
           a1 = bw(startY:eY,:);
          % figure(i);
          % imshow(a1);
          
        end
        
        count = i;
        countline = num2str(count);
        filedir = 'D:\COLLEGE\PROJECTS\Database\ls';
        filename = strcat(filedir,'\', countline,'.tif');
        imwrite(a1,filename,'tif');
       
    end
    

%blobAnalysis.m
close all;
clc;
clear all;

%readImage
%I=imread('D:\COLLEGE\PROJECTS\Database\nn\sperated images\a3.tif');
I=imread('D:\COLLEGE\PROJECTS\Database\abe\abe.tif');
%I=imread('1.jpg');
% I=imread('7.jpg');
figure;
imshow(I);

%convert to gray scale image
Igray=rgb2gray(I);
figure;
imshow(Igray);

%convert to binary image
Ibw=im2bw(Igray, graythresh(Igray));
%Ibw=im2bw(Igray);
figure;
imshow(Ibw);

%edge detection
Iedge=edge(uint8(Ibw));
figure;
imshow(Iedge);

%Morphology
%image dilation
se=strel('square',2);
Iedge2 = imdilate(Iedge, se);
figure;
imshow(Iedge2);

%image filling
Ifill = imfill(Iedge2,'holes');
figure;
imshow(Ifill)

%blobAnalysis
[Ilabel num] = bwlabel(Ifill);
disp(num);
Iprops = regionprops(Ilabel);
Ibox = [Iprops.BoundingBox];
Ibox = reshape(Ibox, [4 num]);
sort(Ibox);
figure;
imshow(I);

%plot on object location
hold on;
for cnt = 1:num
    rectangle('position',Ibox(:,cnt),'edgecolor','r');
end

%crop on object location
hold on;
for cnt = 1:num
    Icrop=imcrop(I, Ibox(:,cnt));
    figure;
    imshow(Icrop);
end


%featureExtractionChainCoding.m
%CharacterRecognition %
%Chain coding and DFT Representation of Samples 
% dft_feature = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];  save dft_feature.mat dft_feature;
%function count = featureExtractionChainCoding(startl , endl)
%function count = featureExtractionChainCoding(start1)
% end1=start1;
% for i=1:11
%for i = start1:end1

%    imfile = 'D:\COLLEGE\PROJECTS\Database\db_1\numbers\1num0.jpg';
 filenumber=1;
for i = 1:430
    
      clear cc ch p;
    r1=0;
    c1=2;
    d=0;
 
       load m.mat;
       load vname.mat;
       load dft_feature.mat;
      
%  imfile='d:\college\projects\database\db\bw\c2.tif'; 
%  imfile= '10.jpg';
% imfile = 'D:\COLLEGE\PROJECTS\Database\nn\sperated images\l1.tif';
%TESTING for image s1


     path = 'D:\COLLEGE\PROJECTS\Database\db_1\numbers\';
     ext = '.jpg';
     filename = strcat(m{1,2}{i,1},ext);
     imfile = strcat(path, filename);

  
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
dft_feature(:,filenumber) = tmp1;
 save dft_feature.mat dft_feature;

%for saving the features in seprate images
% filename_output = strcat(m{1,2}{filenumber,1},'.mat');
% %save(filename_output,dft_feature(:,filenumber));
% save(filename_output, 'tmp1');

filenumber = filenumber+1;
%   tmp1 = fft_p(1:20);
%   tmp1(21:20) = fft_p(end-19:end);

   end

%  num1_0_1 = tmp1;
%  save 1num0.mat num1_0_1;

% save(m{1,2}{i,1},



%test_abcd.m
% test_abcd : Testing Characters A B C D

load c1.mat;
P = c1;
PR = real(P);
PI = imag(P);
clear P;
P = [PR;PI];
load thenet_abcd.mat;
O=sim(net_abcd,P);
max = O(1); 
m = 1; 
for(i = 1:22)

	if O(i)>max 
		m = i; 
		max = O(i);
	end 
end 

switch m 
	case {1,2,3,4,5} 
		disp('The character is A'); 

	case {6,7,8,9,10,11} 
		disp('The character is B'); 
    
    case {12,13,14,15,16} 
		disp('The character is C'); 

    case {17,18,19,20,21,22} 
		disp('The character is D'); 

end 



%%

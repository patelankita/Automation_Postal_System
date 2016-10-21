%Redundancy Correction 
% Remove redundant patches in corners 
%I = imread ('D:\COLLEGE\PROJECTS\database\abl\rb.tif'); 
%I = im2bw(rgb2gray(imread('ocr_45.jpg')));

 %load image3.mat;
%I = im2bw(rgb2gray(image3));
I = im2bw(rgb2gray(imread('ocr_45.jpg')));
% I = im2bw(rgb2gray(imread('newimage.jpg')));



[r c] = size (I); 
 figure; 
 imshow (I);

%Top Crop
for i = 1:890
	for j=1:c
		I(i,j) = 1;
	end
end
%  figure;
%  imshow(I);

%Bottom Crop
for i = 1010:r
	for j=1:c
		I(i,j) = 1;
	end
end
%  figure;
%  imshow(I);


%Left Crop
for i = 890:1030
	for j=1:230
		I(i,j) = 1;
	end
end
% figure;
% imshow(I);


%Right Crop
for i = 890:1030
	for j=930:c
		I(i,j) = 1;
	end
end
figure;
imshow(I);
imwrite(I,'D:\COLLEGE\PROJECTS\database\rc\rc.jpg','jpg');


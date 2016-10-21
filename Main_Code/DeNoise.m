% De-noising 
% H = fspecial ('average', 9); 
% grayImage = rgb2gray(I);
% AI = filter2 (H,grayImage); 
% g = imfilter(AI, H, 'replicate');


I =imread('D:\COLLEGE\PROJECTS\Database\db_1\numbers\3num7.jpg');
J = rgb2gray(I);
K = filter2(fspecial('average',6),J)/255;
imshow(K);
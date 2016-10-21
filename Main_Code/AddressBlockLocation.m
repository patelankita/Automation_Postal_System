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

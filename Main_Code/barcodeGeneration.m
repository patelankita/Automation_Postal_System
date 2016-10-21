%barcodeGeneration.m
% Barcode Generation

I = ones(60,1); 

for i = 1:12
    chr = dpc(1,i); %dpc= delivery point code
    fn = strcat('C:\Users\DV6\Documents\MATLAB\barcode\',chr,'.bmp'); 
    im = imread(fn);
    im = imresize(im,[60,60]); 
    I = [I im];

end
figure; imshow(I,[0 1]);
 

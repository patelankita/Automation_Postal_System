%Address Block Extraction 
I = imread('D:\COLLEGE\PROJECTS\database\rc\rc.jpg'); 
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

%P = imread('D:\COLLEGE\PROJECTS\database\3.jpg'); 
P = imread('ocr_45.jpg'); 
E = imcrop(P,[c1 r1 c2-c1 r2-r1]); 
figure; 
imshow(E);
imwrite(E,'abe.jpg','jpg');
imwrite(E,'D:\COLLEGE\PROJECTS\database\abe\abe.tif','tif');

OCR.m;


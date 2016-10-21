%Character Separation %

I = imread('D:\COLLEGE\PROJECTS\Database\db\bw\a1.tif'); 
figure;
imshow(I); 
[r c] = size(I); 
n = 0;m = 1;rr=1; 
for j = 1:c
    fl = 0; 
    for i = 1:r
        if(I(i,j)==0) 
            fl = fl+1; 
            rr = i;
        end 
    end
    if(fl<7)
        n = n+1; 
        if(n>1) 
            if(rr>70)
                c4(m)=j; 
                n=0; 
                m = m+1;    
            end 
        end 
    end 
end 

m = m-1; 

figure; 
imshow( imcrop(I,[1,1,c4(1),r])); 

for i = 2:m
    figure;
    imshow(imcrop(I,[c4(i-1),1,c4(i)-c4(i-1),r])); 
end

figure;
imshow( imcrop(I,[c4(m),1,c-c4(m),r])); 


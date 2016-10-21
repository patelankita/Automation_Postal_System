%databaseStreetCodes.m
%Database for Street Codes

clear;clc

load('street'); 
n1 = 0; 
while (1)
    n1  = n1 + 1;

    T1 = input('Enter the street name :');
    T2 = input('Enter the street code :'); 
    
    [m,len1] = size(T1);  
    S(n1,1:len1) = T1(1,1:len1); 
    
    [m,len2] = size(T2);
    C(n1,1:len2) = T2(1,1:len2); 
    
    p = input('Any more ?? (0/1)') 
        if p == 0
            break; 
        end
end

save street S C n1;
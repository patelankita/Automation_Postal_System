% testing_lc_abc : Testing Characters a b c
clear all;
close all;

filenumber = 1;
inputchar = 'a';

for i = 1:126
       
    clear O P PI PR m max;
    close all;

    if(i == 43)
        filenumber = 1;
        inputchar = 'b';
    elseif(i == 85)
        filenumber = 1;
        inputchar = 'c';
    end
    
    counter = num2str(filenumber);
    filename = strcat('lc_',inputchar, counter);
    inputfilename = strcat(filename,'.mat');
    
    load (inputfilename);
    %load lc_a3.mat;
    P = tmp1;
    PR = real(P);
    PI = imag(P);
    clear P;
    P = [PR;PI];
    load thenet_lc_abc_1500;
    O=sim(net_lc_abc_1500,P);
    max = O(1); 
    m = 1; 
    for(i = 1:126)

    	if O(i)>max 
    		m = i; 
        	max = O(i);
        end 
    end 

    switch m 
    	case {1,4,7,10,13,16,19,22,25,28,31,34,37,40,43,46,49,52,55,58,61,64,67,70,73,76,79,82,85,88,91,94,97,100,103,106,109,112,115,118,121,124}
        	disp(strcat(filename,'= The character is A')); 

    	case {2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53,56,59,62,65,68,71,74,77,80,83,86,89,92,95,98,101,104,107,110,113,116,119,122,125}
        	disp(strcat(filename,'= The character is B')); 
    
        case {3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,117,120,123,126}
        	disp(strcat(filename,'= The character is C')); 
    end 
    
    filenumber = filenumber+1;
    clear tmp1;
end

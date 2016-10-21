%Testing Characters a b c
% testing_lc_abc_30 
% testing_lc_abc_30_1
clear all;
close all;

% filenumber = 1;
% inputchar = 'a';
% 
% for i = 1:126
%        
%     clear O P PI PR m max;
%     close all;
% 
%     if(i == 43)
%         filenumber = 1;
%         inputchar = 'b';
%     elseif(i == 85)
%         filenumber = 1;
%         inputchar = 'c';
%     end
%     
%     counter = num2str(filenumber);
%     filename = strcat('lc_',inputchar, counter);
%     inputfilename = strcat(filename,'.mat');
%     
%     load (inputfilename);
    load lc_b42.mat;
    P = tmp1;
    PR = real(P);
    PI = imag(P);
    clear P;
    P = [PR;PI];
    load thenet_lc_abc_30_1;
    O=sim(net_lc_abc_30_1,P);
    max = O(1); 
    m = 1; 
    for(i = 1:30)

    	if O(i)>max 
    		m = i; 
        	max = O(i);
        end 
    end 

%     switch m 
%     	case {1,4,7,10,13,16,19,22,25,28}
%         	disp(strcat(filename,'= The character is A')); 
% 
%     	case {2,5,8,11,14,17,20,23,26,29}
%         	disp(strcat(filename,'= The character is B')); 
%     
%         case {3,6,9,12,15,18,21,24,27,30}
%         	disp(strcat(filename,'= The character is C')); 
%     end 
% 
%     filenumber = filenumber+1;


switch m 
    	case {1,4,7,10,13,16,19,22,25,28}
        	disp('The character is A'); 

    	case {2,5,8,11,14,17,20,23,26,29}
        	disp('The character is B'); 
    
        case {3,6,9,12,15,18,21,24,27,30}
        	disp('The character is C'); 
    end 

    clear tmp1;
% end

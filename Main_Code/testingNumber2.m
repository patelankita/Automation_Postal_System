% testingNumber2
% clear P O;
% close all;
% 
% load 1num0.mat;
% P = tmp1;
% PR = real(P);
% PI = imag(P);
% clear P;
% P = [PR;PI];
% clear PR PI tmp1;
% 
% load thenet_num2_40_1550;

O=sim(net_num2_40_1550,P);
max = O(1); 

% m = 1; 
% for i = 1:100
% 	if O(i)>max 
% 		m = i; 
% 		max = O(i);
% 	end 
% end 

m=round(O);

switch m 
	case {1,11,21,31,41,51,61,71,81,91} 
		disp('The number is 0'); 

	case {2,12,22,32,42,52,62,72,82,92} 
		disp('The number is 1'); 
    
    case {3,13,23,33,43,53,63,73,83,93} 
		disp('The number is 2'); 

    case {4,14,24,34,44,54,64,74,84,94} 
		disp('The number is 3'); 

    case {5,15,25,35,45,55,65,75,85,95} 
		disp('The number is 4'); 

    case {6,16,26,36,46,56,66,76,86,96} 
		disp('The number is 5'); 

	case {7,17,27,37,47,57,67,77,87,97} 
		disp('The number is 6'); 
    
    case {8,18,28,38,48,58,68,78,88,98} 
		disp('The number is 7'); 

    case {9,19,29,39,49,59,69,79,89,99} 
		disp('The number is 8'); 

    case {10,20,30,40,50,60,70,80,90,100} 
		disp('The number is 9'); 
        
end 

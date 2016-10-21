load var_mat_w3.mat;
P = var_mat_w3;
PR = real(P);
PI = imag(P);
clear P;
P = [PR;PI];
load thenet.mat;
O=sim(netn,P);
max = O(1); 
m = 1; 
for(i = 1:8)

	if O(i)>max 
		m = i; 
		max = O(i);
	end 
end 

switch m 
	case {1,2,3,4,5} 
		disp('The character is g'); 

	case {6,7,8,9,10,11} 
		disp('The character is k'); 
    
    case {12,13,14,15,16} 
		disp('The character is L'); 

	case {17,18,19,20,21} 
		disp('The character is O'); 
    
    case {22,23,24,25} 
		disp('The character is q'); 

	case {26,27.28,29,30,31} 
		disp('The character is S'); 
    
    case {32,33,34,35,36,37} 
		disp('The character is V'); 

	case {38,39,40,41,42,43} 
		disp('The character is W'); 
end 

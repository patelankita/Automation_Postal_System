load var_mat_l5.mat;
P = var_mat_l5;
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
	case {1} 
		disp('The character is g'); 

	case {2} 
		disp('The character is k'); 
    
    case {3} 
		disp('The character is L'); 

	case {4} 
		disp('The character is O'); 
    
    case {5} 
		disp('The character is q'); 

	case {6} 
		disp('The character is S'); 
    
    case {7} 
		disp('The character is V'); 

	case {8} 
		disp('The character is W'); 
end 

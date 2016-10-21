% test_abcde

load d3.mat;
P = d3;
PR = real(P);
PI = imag(P);
clear P;
P = [PR;PI];
load thenet_abcde.mat;
O=sim(net_abcde,P);
max = O(1); 
m = 1; 
for(i = 1:29)

	if O(i)>max 
		m = i; 
		max = O(i);
	end 
end 

switch m 
	case {1,2,3,4,5} 
		disp('The character is A'); 

	case {6,7,8,9,10,11} 
		disp('The character is B'); 
    
    case {12,13,14,15,16} 
		disp('The character is C'); 

    case {17,18,19,20,21,22} 
		disp('The character is D'); 

    case {23,24,25,26,27,28,29} 
		disp('The character is E'); 

end 

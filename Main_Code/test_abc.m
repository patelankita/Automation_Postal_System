% test_ab

load b6.mat;
P = b6;
PR = real(P);
PI = imag(P);
clear P;
P = [PR;PI];
load thenet_abc.mat;
O=sim(net_abc,P);
max = O(1); 
m = 1; 
for(i = 1:16)

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

end 

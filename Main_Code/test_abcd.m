% test_abcd : Testing Characters A B C D

load b2.mat;
P = b2;
PR = real(P);
PI = imag(P);
clear P;
P = [PR;PI];
load thenet_abcd.mat;
O=sim(net_abcd,P);
max = O(1); 
m = 1; 
for(i = 1:22)

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

end 

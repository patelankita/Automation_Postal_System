%dpc.m
%Delivery Point Code Generation

load('street');

[m n] = size(S);

T = input('Enter the street name :');
[lent,n] = size(T); 
t = 0;

for i = 1:m 
    flag =1;
    [lens,n] = size(S(i)); 
    if lent > lens
        len = lens; 
    else
        len = lent; 
    end

    for j = 1:len
        if S(i,j) ~= T(1,j) 
            flag = 0; 
            break;
        end
    end

    if flag == 1 
        t = i; 
        break;
    end
end

C(i,1)
pin = '641013';

cd = '0'; 
sc=100000+C(i,1); 
sc = num2str(sc); 
[l1,lensc] = size(sc); 
lensc = lensc-1;

for i = 1:lensc 
    sc(1,i) = sc(1,i+1);
end

dpc = strcat(pin,cd,sc);
dpc = dpc(1,1:12)

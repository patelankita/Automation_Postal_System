%dpc.m
%Delivery Point Code Generation

load('street');
load ('pin');

[m n] = size(S);

switch pin
    case '370210' 
            T = 'shaktinagar';
    case '388001'
            T = '100 foot road'
    case '388120'
            T = 'bakroal road'
    case '456709'
            T = 'karelibhug'
    otherwise
            T = '100 foot road'
end
% 
% T = input('Enter the street name :');
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

cd = '0'; 
sc=100000+C(i,1); 
sc = num2str(sc); 
[l1,lensc] = size(sc); 
lensc = lensc-1;

for i = 1:lensc 
    sc(1,i) = sc(1,i+1);
end

%pin = 388001;
%pin = int2str(pin);

dpc = strcat(pin,cd,sc);
dpc = dpc(1,1:12)


%Generate BarCode
tmp=str2num(dpc);
barCode128gen(tmp);
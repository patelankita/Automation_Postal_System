close all;
clc;
clear all;
for i=1:54
    t='z'+i;
    for i=1:10
        for j=1:10
            tmp(i,j)=t(i,j);
        end
    end


d1=tmp(1,1);
d2=tmp(1,2)+tmp(2,1);
d3=tmp(1,3)+tmp(2,2)+tmp(3,1);
d4=tmp(1,4)+tmp(2,3)+tmp(3,2)+tmp(4,1);
d5=tmp(1,5)+tmp(2,4)+tmp(3,3)+tmp(4,2)+tmp(5,1);
d6=tmp(1,6)+tmp(2,5)+tmp(3,4)+tmp(4,3)+tmp(5,2)+tmp(6,1);
d7=tmp(1,7)+tmp(2,6)+tmp(3,5)+tmp(4,4)+tmp(5,3)+tmp(6,2)+tmp(7,1);
d8=tmp(1,8)+tmp(2,7)+tmp(3,6)+tmp(4,5)+tmp(5,4)+tmp(6,3)+tmp(7,2)+tmp(8,1);
d9=tmp(1,9)+tmp(2,8)+tmp(3,7)+tmp(4,6)+tmp(5,5)+tmp(6,4)+tmp(7,3)+tmp(8,2)+tmp(9,1);
d10=tmp(1,10)+tmp(2,9)+tmp(3,8)+tmp(4,7)+tmp(5,6)+tmp(6,5)+tmp(7,4)+tmp(8,3)+tmp(9,2)+tmp(10,1);
d11=tmp(2,10)+tmp(3,9)+tmp(4,8)+tmp(5,7)+tmp(6,6)+tmp(7,5)+tmp(8,4)+tmp(9,3)+tmp(10,2);
d12=tmp(3,10)+tmp(4,9)+tmp(5,8)+tmp(6,7)+tmp(7,6)+tmp(8,5)+tmp(9,4)+tmp(10,3);
d13=tmp(4,10)+tmp(5,9)+tmp(6,8)+tmp(7,7)+tmp(8,6)+tmp(9,5)+tmp(10,4);
d14=tmp(5,10)+tmp(6,9)+tmp(7,8)+tmp(8,7)+tmp(9,6)+tmp(10,5);
d15=tmp(6,10)+tmp(7,9)+tmp(8,8)+tmp(9,7)+tmp(10,6);
d16=tmp(7,10)+tmp(8,9)+tmp(9,8)+tmp(10,7);
d17=tmp(8,10)+tmp(9,9)+tmp(10,8);
d18=tmp(9,10)+tmp(10,9);
d19=tmp(10,10);


end
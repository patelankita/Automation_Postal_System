function [cc,d,r1,c1]=seven(r1,c1,cc,im,i)

if im(r1+1,c1+1) == 1 
    r1 = r1+1;
    c1 = c1+1;
    d = 7;
    cc(i,1:2) = [r1,c1];
elseif im(r1-1,c1+1) == 1 
    r1 = r1-1; 
    c1 = c1+1;
    d = 1;
    cc(i,1:2) = [r1,c1];
elseif im(r1,c1+1) == 1 
    c1 = c1+1; 
    d = 0; 
    cc(i1:2) = [r1,c1];
elseif im(r1+1,c1-1) == 1 
    r1 = r1+1; 
    c1 = c1-1; 
    d = 5; 
    cc(i,1:2) = [r1,c1];
elseif im(r1+1,c1) == 1 
    r1 = r1+1; 
    d = 6; 
    cc(i,1:2) = [r1,c1];
end 
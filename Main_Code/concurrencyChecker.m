%concurrencyChecker.m
% Concurrency Checker

function [pin, ct, lc, st , sr,dt] = concurrent(pin, ct, lc,st,sr,dt ) 
%Code for concurrency checker
% pin - pincode;gotit
% ct = city name;gotit
% lc = localityname; not having
% st - state ; gotit
% sr - street name; not having
% dt - district name;gotit

load('pin.mat');
load('st.mat');
load('sr.mat');
load('ct.mat');
load('lc.mat');
load('dt.mat')

%[pin, ct, lc, st , sr] = concurrent(pin, ct, lc,st,sr );
%The above statement passes control from the main program to this function
%fl = conc(pin,lc) 
%Conc is a function that checks is the pincode and locality name are concurrent if fl == 0 

[pin, lc] = correct(pin,lc,st,dt) 
%This function corrects the pincode or locality

end

fl = conc(st,pin)
if fl == 0
    st = correct(st,pin)
end
    
    %	pin and st now represent the pincode and street code
    %	These are the imperative fields required for generating the DPC 
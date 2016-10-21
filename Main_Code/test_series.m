%a
index = 1;

for i = 1:10
       
%     load lc_a2.mat;
    %tmp1 = strcat('a',num2str(i));
    tmp1='a';
    dft_feature_lc_1 (:,index) = tmp1;
    index = index+3;
    
    clear tmp1;
end
   
%b
index2 = 2;

for i = 1:10
    
%     load lc_b6.mat;
    tmp1 = 'b';%strcat('b',num2str(i));
    dft_feature_lc_1 (:,index2) = tmp1;
    
    index2 = index2+3;
    clear tmp1;
end

%c
index3 = 3;
for i = 1:10
       
%     load lc_c1.mat;
    tmp1 = 'c';% strcat('c',num2str(i));
    dft_feature_lc_1 (:,index3) = tmp1;
    index3 = index3+3;
    
    clear tmp1;
end

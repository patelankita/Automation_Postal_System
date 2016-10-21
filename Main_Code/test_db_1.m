close all;
clear all;
clc;
i=44;    
counter = num2str(i);
    inputfilename = strcat(counter,'.jpg');
    inputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\',inputfilename);
    I = imread (inputfilepath);
  figure;
     imshow(I);
    [r c] = size (I); 
    
    %J = imcrop(I, [1 3800 c 720]);
    
    K = imcrop(I, [1 3800 c 345]); %first line num 0-6
    figure; imshow(K);
    [r1 c1] = size(K);
    
    L = imcrop(K, [1 1 600 320]); %num 0
    L1 = imcrop(K, [640 1 600 320]); %num 01
    L2 = imcrop(K, [1280 1 600 320]); %num 02
    L3 = imcrop(K, [1920 1 600 320]); %num 03
    L4 = imcrop(K, [2560 1 600 320]); %num 04
    L5 = imcrop(K, [3200 1 600 320]); %num 05
    L6 = imcrop(K, [3840 1 600 320]); %num 06
      
    figure;imshow(L);
    figure;imshow(L1);
    figure;imshow(L2);
    figure;imshow(L3);
    figure;imshow(L4);
    figure;imshow(L5);
    figure;imshow(L6);

    
    K = imcrop(I, [1 4150 c 345]); %second line num 7-9
    figure; imshow(K);
    [r1 c1] = size(K);
    
    L7 = imcrop(K, [1 1 600 320]); %num 07
    L8 = imcrop(K, [640 1 600 320]); %num 08
    L9 = imcrop(K, [1280 1 600 320]); %num 09
      
    figure;imshow(L7);
    figure;imshow(L8);
    figure;imshow(L9);

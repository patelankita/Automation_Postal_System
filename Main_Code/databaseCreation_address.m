%DatabaseCreation_address

clc;
clear all;
close all;
% seperating lower case
for i = 40:40
    counter = num2str(i);
    inputfilename = strcat(counter,'.jpg');
    inputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\',inputfilename);
    I = imread (inputfilepath);
%     figure;
%     imshow(I);
    [r c] = size (I); 
    
    %line a-g
    K = imcrop(I, [1 2020 c 350]); %first line num a-g
    %figure; imshow(K);
    [r1 c1] = size(K);
    a=60;
    for i1=0:6
        %crop image
        L0 = imcrop(K, [a 20 540 320]);
        %figure;imshow(L0);
        
        %output file name and path
        ctr = 97 + i1;
        ctr1 = char(ctr);
        outfilename = strcat (ctr1, counter,'.jpg');
        outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\lowercase\',outfilename);
        
        imwrite(L0,outputfilepath,'jpg');
        
        a=a+640;
    end
    
    %cell 7-13
    K = imcrop(I, [1 2420 c 350]); %second line h-n
    %figure; imshow(K);
    [r1 c1] = size(K);
    a=60;
    for i1=7:13
        %crop image
        L0 = imcrop(K, [a 20 540 320]); 
        %figure;imshow(L0);
        
        %output file name and path
        ctr = 97 + i1;
        ctr1 = char(ctr);
        outfilename = strcat (ctr1, counter,'.jpg');
        outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\lowercase\',outfilename);
        
        imwrite(L0,outputfilepath,'jpg');
        
        a=a+640;
    end
    
    %cell 14-20
    K = imcrop(I, [1 2820 c 350]); %second line o-u
    %figure; imshow(K);
    [r1 c1] = size(K);
    a=60;
    for i1=14:20
        %crop image
        L0 = imcrop(K, [a 20 540 320]);
        %figure;imshow(L0);
        
        %output file name and path
        ctr = 97 + i1;
        ctr1 = char(ctr);
        outfilename = strcat (ctr1, counter,'.jpg');
        outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\lowercase\',outfilename);
        
        imwrite(L0,outputfilepath,'jpg');
        
        a=a+640;
    end
    
    %cell 21-25
    K = imcrop(I, [1 3220 c 350]); %second line v-z
    %figure; imshow(K);
    [r1 c1] = size(K);
    a=60;
    for i1=21:25
        %crop image
        L0 = imcrop(K, [a 20 540 320]);
        %figure;imshow(L0);
        
        %output file name and path
        ctr = 97 + i1;
        ctr1 = char(ctr);
        outfilename = strcat (ctr1, counter,'.jpg');
        outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\lowercase\',outfilename);
        
        imwrite(L0,outputfilepath,'jpg');
        
        a=a+640;
    end
end



% seperating Numbers
% for i = 1:1
%     counter = num2str(i);
%     inputfilename = strcat(counter,'.jpg');
%     inputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\',inputfilename);
%     I = imread (inputfilepath);
% %     figure;
% %     imshow(I);
%     [r c] = size (I); 
%     
%     %line 0-6
%     K = imcrop(I, [1 3800 c 345]); %first line num 0-6
%   %  figure; imshow(K);
%     [r1 c1] = size(K);
%     a=60;
%     for i1=0:6
%         %crop image
%         L0 = imcrop(K, [a 20 540 240]); %num 0
%         %figure;imshow(L0);
%         
%         %output file name and path
%         ctr = num2str(i1);
%         outfilename = strcat (counter,'num',ctr,'.jpg');
%         outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\numbers\',outfilename);
%         
%         imwrite(L0,outputfilepath,'jpg');
%         
%         a=a+640;
%     end
%     
%     %line 7-9
%     K = imcrop(I, [1 4150 c 345]); %second line num 7-9
%     %figure; imshow(K);
%     [r1 c1] = size(K);
%     a=60;
%     for i1=7:9
%         %crop image
%         L0 = imcrop(K, [a 20 540 240]); %num 0
%         %figure;imshow(L0);
%         
%         %output file name and path
%         ctr = num2str(i1);
%         outfilename = strcat (counter,'num',ctr,'.jpg');
%         outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\numbers\',outfilename);
%         
%         imwrite(L0,outputfilepath,'jpg');
%         
%         a=a+640;
%     end
% end
%         
%     L1 = imcrop(K, [640 1 600 320]); %num 01
%     L2 = imcrop(K, [1280 1 600 320]); %num 02
%     L3 = imcrop(K, [1920 1 600 320]); %num 03
%     L4 = imcrop(K, [2560 1 600 320]); %num 04
%     L5 = imcrop(K, [3200 1 600 320]); %num 05
%     L6 = imcrop(K, [3840 1 600 320]); %num 06
%       
%     figure;imshow(L0);
%     figure;imshow(L1);
%     figure;imshow(L2);
%     figure;imshow(L3);
%     figure;imshow(L4);
%     figure;imshow(L5);
%     figure;imshow(L6);
%     
%     K = imcrop(I, [1 4150 c 345]); %second line num 7-9
%     figure; imshow(K);
%     [r1 c1] = size(K);
%     
%     L7 = imcrop(K, [1 1 600 320]); %num 07
%     L8 = imcrop(K, [640 1 600 320]); %num 08
%     L9 = imcrop(K, [1280 1 600 320]); %num 09
%       
%     figure;imshow(L7);
%     figure;imshow(L8);
%     figure;imshow(L9);
%     
%     for i1= 0:9
%         
%         %output file name and path
%         ctr = num2str(i1);
%         outfilename = strcat (counter,'num',ctr,'.jpg');
%         outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\numbers\',outfilename);
% 
%         %segmented numbers image name L0-L9
%         imgname = strcat('L',ctr);
% 
%         imwrite(imgname,outputfilepath,'jpg');
%     end
% end


% 
% % seperating Address
% for i = 44:44
%     counter = num2str(i);
%     inputfilename = strcat(counter,'.jpg');
%     inputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\',inputfilename);
%     I = imread (inputfilepath);
% %     figure;
% %     imshow(I);
%     [r c] = size (I); 
%     
%     E = imcrop(I, [950 4550 2500 c-4550]);
%     
%     outputfilepath = strcat('D:\COLLEGE\PROJECTS\Database\db_1\address\',inputfilename);
%     imwrite(E,outputfilepath,'jpg');
%     
%      figure;
%      imshow(E);
% end

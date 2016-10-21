function [words] = wordSegmentation(line)

% wordsEGMENTATION This function takes an line and separates words by creating 
% horizontal cuts. 
    clear all;
    close all;
    line=imread('D:\COLLEGE\PROJECTS\Database\ls\4.tif');
    
    % Generate a histogram
    bw = im2bw(line, 0.7);
    %bw = line;
    bw_trans = (bw(2:end,:) - bw(1:end-1,:)) ~= 0 ;
    inv_bw = invertBwImage(bw);
    hist_line = sum(inv_bw, 1) ;
    hist_line = sum(line, 1,'double');
    
% close all
    figure;
    imshow(inv_bw);
    figure;
    imshow(line);
    figure;
    imshow(bw);
    figure;
    imshow(hist_line);
    
    % Find cut points
    cut_points = findWordsCutPoints(hist_line, line);
    i=0;
    % Extract the words
    for i = 1:size(cut_points,1)
        words(i).originalImage = line(:, cut_points(i,1):cut_points(i,2));
        words(i).bwImage = bw(:, cut_points(i,1):cut_points(i,2));
    end
    
    % Display the segmented words
    %close all 
    figure;
    for j = 1:i
        figure;
        imshow(words(j).originalImage);
        %subplot(2, 3, j), imshow(words(j).originalImage); 
    end 

end
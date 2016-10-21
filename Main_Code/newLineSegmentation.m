
function [] = newLineSegmentation(im)
    
% LINESEGMENTATION This function takes a black and white image and separates lines by creating 
% horizontal cuts. This will not work if the lines have a large skew

im = imread('D:\COLLEGE\PROJECTS\database\abe\abe.tif');    
im = imcomplement(im2bw(rgb2gray(im)));
figure;
imshow(im);

    % CONSTANT DECLARATIONS:
    PEAK_DELTA_FACTOR = 6;
    THRESHOLD = 1;
    HEIGHT = 200;

    % Transform the image in black and white
    bw = im2bw(im);
    
    % Generate a histogram
    bw_trans = (bw(:,2:end) - bw(:,1:end-1)) ~= 0;
    im_hist = sum(bw_trans,2);
    
    % Smooth the histogram with a 1-D median filter
    im_hist = medfilt1(im_hist);
    

    % Find minima in histogram
    [max_peaks, min_peaks] = peakdet(im_hist, floor(max(im_hist)/PEAK_DELTA_FACTOR)); %#ok<ASGLU>

    % Plot the histogram
    figure(99); area(im_hist);
    hold on; 
    plot(min_peaks(:,1), min_peaks(:,2), 'r*');
    h = legend('Histogram of lines', 'Significant Minima');
    title('Vertical Histogram');

    % Plot the file with horizontal cuts
    x = 1:1:size(im,2);
    figure(100);
    imshow(im,[]);
    
    hold on;
    plot(x, repmat(min_peaks(:,1), [1, size(im,2)]), '-r');
    title('Original text segmented in lines');
   imwrite(im,'D:\COLLEGE\PROJECTS\Papers\Mehul, rajmohan\Line segmentated images\line_segment.tif');
    
%     disp(min_peaks);
    cut_points = [min_peaks(:,1); size(im,1)];
   % disp(cut_points);
    
    % Return a structure where every element is a line segmented
    % lines = struct([]);
    
    prev = ones(size(min_peaks,1),1);
    % Loop over the lines
    size_cut_points = size(cut_points,1);
    for i = 1:size_cut_points    
        if i ~= 1
            prev(i) = cut_points(i-1);
        end
        
        % Extracted segment
        current_segm = bw(prev(i):cut_points(i),:);
%        disp(cut_points(i));
        % We eliminate an eventually white part
        bw_trans = (current_segm(:,2:end) - current_segm(:,1:end-1)) ~= 0;
        segm_hist = sum(bw_trans,2) ;
        segm_logical_hist = segm_hist > THRESHOLD;
        points = find(segm_logical_hist);
        
%        disp(points(i));
        ascender_cut_point = points(1)-1;
        if ascender_cut_point == 0 
            ascender_cut_point = 1;
        end
        %descender_cut_point = points(end) + 1; 
        descender_cut_point = points(end) + i;
        
       % if descender_cut_point >= 1;
        %    descender_cut_point = 0;
        %end
        
        % New Y coordinates 
        startY = prev(i) + ascender_cut_point;
        eY = prev(i) + descender_cut_point - i - 1;
        disp([ startY, ascender_cut_point, eY ,descender_cut_point]);      
        % Output of the function
        %lines(i).originalImage = im(startY:eY, :, :);
        %lines(i).bwImage = bw(startY:eY, :);
        %lines(i).startY = startY;
        %lines(i).eY = eY;
        
        if eY <= HEIGHT
%             a1 = imcrop(bw, [0 startY size(im, 1) HEIGHT]);
              a1 = bw(startY:HEIGHT,:);  
            figure(i);
            imshow(a1);
        else
%             a1 = imcrop(bw, [0 startY size(im,1) eY]);
%             a1 = imcrop(bw, [0 prev(i) size(im,1) cut_points(i)]);
           a1 = bw(startY:eY,:);
           figure(i);
           imshow(a1);
          
        end
        
        count = i;
        countline = num2str(count);
        filedir = 'D:\COLLEGE\PROJECTS\Papers\Mehul, rajmohan\Line segmentated images';
        filename = strcat(filedir,'\', countline,'.tif');
        imwrite(a1,filename,'tif');
       
    end
end
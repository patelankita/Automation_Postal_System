I = imread('D:\COLLEGE\PROJECTS\Papers\Mehul, rajmohan\Inverted images\i5a1.jpg');
level = graythresh(I);
bwI = im2bw(I,level);

[rows cols] = size(bwI);

rowI1 = sum(bwI')';

for i=1:size(rowI1)
rowI1(i) = cols - rowI1(i);
end

plot(rowI1)

[rowL, colL] = size(rowI1);
%---------P(1,:) --> row 1, all column
l = 1;
bool = 1;
for k = 1 : rowL-1
if bool == 1
if rowI1(k,1) == 0 && rowI1( k+1, 1) > 0
startI(l) = k;
bool = 0;
end
else
if rowI1(k,1) > 0 && rowI1( k+1, 1) == 0
endL(l) = k;
bool = 1;
l = l + 1;
end

end
end


clear line
lineNo = 5;
for i = startI(lineNo) : endL(lineNo)
for j = 1 : cols
line(i-startI(lineNo)+1,j) = bwI(i,j);
end 
end
imshow(line)



%---------------------------------------------------------
% word segmentation
%---------------------------------------------------------

[lineRow lineCol] = size(line);
linePix = sum(line);

for i=1:lineCol
linePix(i) = lineRow - linePix(i);
end


l = 1;
bool = 1;
for k = 1 : lineCol - 1
if bool == 1
if linePix(1,k) == 0 & linePix(1,k+1) > 0
wordStart(l) = k;
bool = 0;
end
else
if linePix(1,k) > 0 & linePix(1,k+1) == 0
wordEnd(l) = k;
bool = 1;
l = l + 1;
end
end
end


clear word
wordNo = 2;
for i = 1 : lineRow 
for j = wordStart(wordNo) : wordEnd(wordNo)
word(i, j-wordStart(wordNo)+1) = line(i,j);
end 
end

imshow(word)

%---------------------------------------------------------
%convertJPGtoPGM

person = 1;
for i=1:10
    
    filename = strcat('.\',person,'num',i,'.jpg');
    newfilename = strcat('.\',person,'num',i,'.pgm');
    A = imread(filename);
    imwrite(A, newfilename, '.pgm');
    
    person = person+1;
end

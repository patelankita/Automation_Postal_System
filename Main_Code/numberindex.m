%FILEOPERATION

% number,1num0.jpg
% number,1num1.jpg
% number,1num2.jpg

fName = 'variablename.dat';               %# A file name
fid = fopen(fName,'w');            %# Open the file

%foldername = {'number'; 'lowercase'; 'uppercase'};
foldername = 'number';

for i=1:44
    for counter = 0:9
        if i== 43
            break;
        end
        i1 = num2str(i);
        ctr = num2str(counter);
        filename = strcat('num',i1,'_',ctr);
        str_filename = strcat(filename);
        fprintf(fid,'%s\r\n',str_filename);       %# Print the string
    end
end

fclose(fid);                     %# Close the file


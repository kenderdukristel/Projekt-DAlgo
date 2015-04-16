fileID = fopen('allsenlist.txt');


gesucht = input('Gesuchten Phrase eingeben: ');
sen = textscan(fileID, '%s','delimiter','\n');

fileList = [];

senVec = sen{1};

for i=1:length(senVec)
    s = strfind(senVec{i},gesucht);
    if isempty(s)==0
        c = strsplit(senVec{i},'\t');
        fileList = [fileList; c{1}];
    end
end

disp(fileList)

fclose(fileID);
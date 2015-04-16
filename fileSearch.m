function fileNames = fileSearch(id, sen, word, phon)
%funktion erhält werte für sprecher-id, satz, wort und phonem, nach denen
%gesucht werden soll
%wenn einer der parameter nicht angegeben wurde, muss er wert 0 erhalten
%ausgabe von cellarray mit allen dateinamen die auf angaben zutreffen

%dateien öffnen und einlesen
fileID1 = fopen('Projekt-DAlgo/TIMIT MIT/allsenlist.txt');
fileID2 = fopen('Projekt-DAlgo/TIMIT MIT/allphonelist.txt');

senFile = textscan(fileID1, '%s','delimiter','\n');
phonFile = textscan(fileID2, '%s','delimiter','\n');

senVec = senFile{1};
phonVec = phonFile{1};

%cellarray mit allen dateien
fileList = {};
for i=1:length(senVec)
    s = strfind(senVec{i},'d');
    if isempty(s)==0
        c = strsplit(senVec{i},'\t');
        fileList = [fileList; c{1}];
    end
end

%nach sprecher-id
if id~=0
    fileListID = {};
    for i=1:length(senVec)
        s = strfind(senVec{i},id);
        if isempty(s)==0
            c = strsplit(senVec{i},'\t');
            fileListID = [fileListID; c{1}];
        end
    end
else
    fileListID = fileList;
end

%nach satz
if sen~=0
    fileListSen = {};
    for i=1:length(senVec)
        s = strfind(senVec{i},sen);
        if isempty(s)==0
            c = strsplit(senVec{i},'\t');
            fileListSen = [fileListSen; c{1}];
        end
    end
else
    fileListSen = fileList;
end

%nach wort
if word~=0
    fileListWord = {};
    for i=1:length(senVec)
        s = strfind(senVec{i},word);
        if isempty(s)==0
            c = strsplit(senVec{i},'\t');
            fileListWord = [fileListWord; c{1}];
        end
    end
else
    fileListWord = fileList;
end

%nach phonem
if phon~=0
    fileListPhon = {};
    for i=1:length(phonVec)
        s = strfind(phonVec{i},phon);
        if isempty(s)==0
            c = strsplit(phonVec{i},'\t');
            fileListPhon = [fileListPhon; c{1}];
        end
    end
else
    fileListPhon = fileList;
end

%intersect() gibt array mit den elementen aus, die in beiden arrays sind
fileNames = intersect(fileListID,fileListSen);
fileNames = intersect(fileNames, fileListWord);
fileNames = intersect(fileNames, fileListPhon);


fclose(fileID1);
fclose(fileID2);

end
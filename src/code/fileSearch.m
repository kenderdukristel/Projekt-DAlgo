function fileNames = fileSearch(id, sen, word, phon)
% function to search the database after the parameters speaker, sentence,
% word and phonem
% Usage fileNames = fileSearch(id, sen, word, phon)
% Input Parameter:
%	 id:            string containing speaker id, if not used give 0
%	 sen:           string containing sentence, if not used give 0
%	 word:          string containing word, if not used give 0
%	 phon:          string containing phonem, if not used give 0
% Output Parameter:
%	 fileNames:     cell array containing the names of the files matching
%                   all given parameter
%------------------------------------------------------------------------
% Example: fileNames = fileSearch('cpm0', 0, 'suit', 0);

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF

% Version History:
% Ver. 0.01 initial create (empty) 15-Apr-2015  KH
% Ver. 1.00 first implementation 15-Apr-2015  KH
% Ver. 1.10 splited function in two functions, new for-loop 18-Apr-2015  KH

%------------Function implementation---------------------------

%allsenlist.txt and allphonelist.txt contain all needed information 
%--> sentences and phonems to each file, speaker id in filename
fileID1 = fopen('../../TIMIT MIT/allsenlist.txt');
fileID2 = fopen('../../TIMIT MIT/allphonelist.txt');
%cell array with text of file in strings, delimited by line break
senFile = textscan(fileID1, '%s','delimiter','\n');
phonFile = textscan(fileID2, '%s','delimiter','\n');

fclose(fileID1);
fclose(fileID2);

%searching in file for each paramter with function fileSearchPar()
%fileSearchPar() returns cell array with all file names matching par{i}
%fileNamesAll is cell array containg found filenames for each of the four
%parameters in one row
fileNamesAll = {{} {} {} {}};
par = {id, sen, word, phon}; 
%parID specifies in which file to search for which parameter
parID = [senFile, senFile, senFile, phonFile]; 
for i=1:length(par)
    fileNamesAll{i} = fileSearchPar(parID(i),par{i});
end

%intersect() gives  back cell array with elements equal in both given cell array
%comparison, which filenames are in all of the four cell arrays
%--> matching all parameters
fileNames = intersect(fileNamesAll{1},fileNamesAll{2});
fileNames = intersect(fileNames, fileNamesAll{3});
fileNames = intersect(fileNames, fileNamesAll{4});

end
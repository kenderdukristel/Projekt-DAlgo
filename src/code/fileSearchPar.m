function fileListPar = fileSearchPar(fileCell,par)
% function to search in given cell array after given string
% Usage fileListPar = fileSearchPar(fileCell,par)
% Input Parameter:
%	 fileCell: 		cell array containing content of file in strings for
%                   each line
%	 par:           string to search for, give 0 for all data
% Output Parameter:
%	 fileListPar: 	cell array containig the names of the files where par
%                   is found
%------------------------------------------------------------------------
% Example: fileListPar = fileSearchPar(senFile,'cpm0')

% Author: Finn Bayer, Kristin Haﬂelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF

% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  KH
% Ver. 1.00 first implementation 18-Apr-2015  KH
% Ver. 1.10 added for-loop to ignore filename for search 25-Apr-2015  KH

%------------Function implementation---------------------------

%vec contains all strings of the lines
vec = fileCell{1};

%fileList is a cell array containing all filenames, needed if par is 0
fileList = {};
for i=1:length(vec)
    c = strsplit(vec{i},'\t'); %spliting after first tab to get filename
    fileList = [fileList; c{1}];
end


%search for par in fileCell
fileListPar = {};
if par~=0
    %split strings containing the lines to avoid searching in filename, for 
    %all parameters except speaker id (speaker id is identified by last 
    %element of the first string being a number)
    if isempty(str2double(par(length(par))))==1
        for k = 1:length(vec)
            lineSplitted = strsplit(vec{k},'\t');
            vec{k} = lineSplitted{2};
        end
    end
    %search in the cell array vec after the string par
    %fileListPar is cell array containing all filenames where par is found
    for i=1:length(vec)
        s = strfind(vec{i},par); %search for par in one line
        if isempty(s)==0
            c = strsplit(vec{i},'\t');
            fileListPar = [fileListPar; c{1}];
        end
    end
else
    %if par is zero fileListPar is cell array with all filenames
    fileListPar = fileList;
end

end
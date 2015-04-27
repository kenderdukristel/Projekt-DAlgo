function fileListPar = fileSearchPar(fileCell,par,partString)
% function to search in given cell array after given string
% Usage fileListPar = fileSearchPar(fileCell,par,partString)
% Input Parameter:
%	 fileCell: 		cell array containing content of file in strings for
%                   each line
%	 par:           string to search for, give 0 for all data
%    partString:    number that specifies the part of the line in which to
%                   search
% Output Parameter:
%	 fileListPar: 	cell array containig the names of the files where par
%                   is found
%------------------------------------------------------------------------
% Example: fileListPar = fileSearchPar(senFile,'cpm0',1)

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF

% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  KH
% Ver. 1.00 first implementation 18-Apr-2015  KH
% Ver. 1.10 added for-loop to ignore filename for search 25-Apr-2015  KH
% Ver. 1.20 added new argument, for-loop modified 27-Apr-2015  KH

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
    %split line by tab and only save first or second (specified by
    %partString) part of the line in vec
    for k = 1:length(vec)
        lineSplitted = strsplit(vec{k},'\t');
        vec{k} = lineSplitted{partString};
    end
    %search in the cell array vec after the string par
    %fileListPar is cell array containing all filenames where par is found
    for i=1:length(vec)
        s = strfind(vec{i},par); %search for par in one line
        if isempty(s)==0
            newFileName = fileList{i}; %add current filename to list
            fileListPar = [fileListPar; newFileName];
        end
    end
else
    %if par is zero fileListPar is cell array with all filenames
    fileListPar = fileList;
end

end
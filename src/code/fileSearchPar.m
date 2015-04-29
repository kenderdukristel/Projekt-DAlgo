function fileListPar = fileSearchPar(fileCell,par,partString)
% function to search in given cell array after given string
% Usage fileListPar = fileSearchPar(fileCell,par,partString)
% Input Parameter:
%	 fileCell: 		cell array containing content of file in strings for
%                   each line
%	 par:           searchstring, if zero, fileSearchPar returns all filenames
%    partString:    number that specifies the part of the line in which to
%                   search
% Output Parameter:
%	 fileListPar: 	cell array containig the names of the files where par
%                   is found
%------------------------------------------------------------------------
% Example: fileListPar = fileSearchPar(senFile,'cpm0',1)

% Author: Finn Bayer, Kristin Hasselbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF

% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  (FB,KH,SW)
% Ver. 1.00 first implementation 18-Apr-2015  (FB,KH,SW)
% Ver. 1.10 added for-loop to ignore filename for search 25-Apr-2015  (FB,KH,SW)
% Ver. 1.20 added new argument, for-loop modified 27-Apr-2015  (FB,KH,SW)
% Ver. 2.00 improved the search algorithm 29-Apr-2015 (FB,KH,SW)


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
    
    %%%%%%%%%%% Editing String to improve search algorithm %%%%%%%%%%%%%%%%
    
    %to avoid case sensivity
    par = lower(par);
    if partString == 2
        %add spaces to the search string to avoid getting matches for
        %only parts of the word
        par = [' ' par ' '];
        %delete commata and dots to recognize words near the punctuations
        par = strrep(par,',','');
        par = strrep(par,'.','');
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%% Search algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for k = 1:length(vec)
        
        %split line by tab to seperate into filename and sentence
        lineSplitted = strsplit(vec{k},'\t');
        
        %if searching for the speaker id-> extraction from the filename
        if partString == 1
            temp = strsplit(lineSplitted{partString},{'-','/'});
            lineSplitted{1} = temp{2}(2:end);
        end
        
        %add spaces to the reference string to avoid getting matches for
        %only parts of the word
        lineSplitted{partString} = [' ' lineSplitted{partString} ' '];
        
        %search in the part of the line (lineSplitted) for the search
        %string
        s = strfind(lineSplitted{partString},par);
        
        %fileListPar is a cell array containing all filenames where par is found
        if isempty(s)==0
            newFileName = fileList{k};
            fileListPar = [fileListPar; newFileName];%add current filename to list
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
else
    %if given parameter is not specified, fileListPar is cell array with all filenames
    fileListPar = fileList;
end

end
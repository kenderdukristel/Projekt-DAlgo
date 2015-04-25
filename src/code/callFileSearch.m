function fileNames = callFileSearch(typePar, par)
% function to call function fileSearch with one parameter, whos type is
% specified by a given string
% Usage fileNames = callFileSearch(typePar, par)
% Input Parameter:
%	 typePar:       string 'id','sen','word' or 'phon' specifying the type
%                   of the string to search for
%    par:           string to search for via fileSearch
% Output Parameter:
%	 fileNames: 	cell array containing the names of the files matching
%                   the given paramter
%------------------------------------------------------------------------ 
% Example: fileNames = callFileSearch('id','cpm0');

% Author: Finn Bayer, Kristin Haﬂelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 

% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2015  KH
% Ver. 1.00 first implementation 25-Apr-2015  KH

%------------Function implementation--------------------------- 


switch typePar
    case 'id'
        fileNames = fileSearch(par,0,0,0);
    case 'sen'
        fileNames = fileSearch(0,par,0,0);
    case 'word'
        fileNames = fileSearch(0,0,par,0);
    case 'phon'
        fileNames = fileSearch(0,0,0,par);
end


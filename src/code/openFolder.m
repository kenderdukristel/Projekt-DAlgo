function [] = openFolder(folderdir)
% function to do something usefull (fill out)
% Usage [out_param] = openFolder(in_param)
% Input Parameter:
%	 folderdir: 		String, inherits the direction and the name of the
%	 folder
%------------------------------------------------------------------------ 
% Example: Opens the folder in the native GUI

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  Initials (eg. JB)

%------------Function implementation--------------------------- 

%get the current os
curOs = computer;
if strfind(curOs,'WIN')==1 %Windows
    system(['explorer ' folderdir]);
    
elseif strfind(curOs,'GLN')==1  %Linux
    system(['nautilus ' folderdir]);
elseif strfind(curOs,'MAC')==1 %Mac
    system(['open ' folderdir]);
    
else
    disp('Your current OS is not supported. Sorry!')
end

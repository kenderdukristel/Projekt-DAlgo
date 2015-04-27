function [] = openFolder(filedir)
% function to do something usefull (fill out)
% Usage [out_param] = openFolder(in_param)
% Input Parameter:
%	 filedir: 		String, inherits the direction and the name of the
%	 file
%------------------------------------------------------------------------ 
% Example: Opens the folder of the given file in the native GUI

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  Initials (eg. JB)

%------------Function implementation--------------------------- 
%get the current os
curOs = computer;

%extracting the folderdir
data = strsplit(filedir,'/');
%getting the full path of the file
if strfind(curOs,'WIN')~=0 %Windows
    slash = '\';
else
    slash = '/';
end

folderdir=['"' pwd slash data{1} slash data{2} '"'];


%compare the current os with Windows, Linux and Mac and than use the
%expected command
if strfind(curOs,'WIN')~=0 %Windows
    system(['explorer ' folderdir]);
elseif strfind(curOs,'GLN')~=0  %Linux
    system(['nautilus ' folderdir]);
elseif strfind(curOs,'MAC')~=0 %Mac
    system(['open ' folderdir]);
else
    disp('Your current OS is not supported. Sorry!')
end

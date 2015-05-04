function [] = openFolder(filedir)
% function to open the Folder which contains the selected file 
% Usage [] = openFolder('C:/dir/file.txt')
% Input Parameter:
%	 filedir: 		String, contains the direction and the name of the
%	 file
%------------------------------------------------------------------------ 

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  Initials (eg. JB)
% Ver. 1.0 implemented the code and fixed some early bugs 29-Apr-2015 (FB,KH,SW)

%------------Function implementation--------------------------- 
%get the current os
curOs = computer;
%extracting the folderdir
data = strsplit(filedir,'/');

%compare the current os with Windows, Linux and Mac and than use the
%expected command
if strfind(curOs,'WIN')~=0 %Windows
    folderdir=[pwd '"' '\' data{1} '\' data{2} '"'];
    system(['explorer ' folderdir]);
elseif strfind(curOs,'GLN')~=0  %Linux
    folderdir=['"' pwd '/' data{1} '/' data{2} '"'];
    system(['nautilus ' folderdir]);
elseif strfind(curOs,'MAC')~=0 %Mac
    folderdir=[pwd '/' data{1} '/' data{2} ];
    %replacement of the space is necessary to open TIMIT MIT on OSX
    folderdir = strrep(folderdir,' ','\ ');
    system(['open ' folderdir]);
else
    disp('Your current OS is not supported. Sorry!')
end

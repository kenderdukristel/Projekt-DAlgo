function newScript(szFileName,szAuthor)
% function to create a new Script m file with all relevant documentation (to be filled)
% Usage: newScript(szFileName,szAuthor)
% Input parameter:
%       szFileName:  Name of new m-file without extension (.m)
%       szAuthor:    Name of Author
% Output parameter:
%       None
% Output:
%    a new m file with comments but no functionality

% Author: J. Bitzer (c) IHA @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty)              14-Apr-2011 JB
% Ver. 1.0  implemented and tested              14-Apr-2011 JB
% Ver. 1.1  Added automatic opening of editor   12.Jul-2011 JB

szTestReturn = which(szFileName);

if ~isempty(szTestReturn)
%    error(sprintf('function exists in matlab path, see %s',szTestReturn));
    error('function or script with the same name exists in matlab path\n, see %s',szTestReturn);
end

fid = fopen(sprintf('%s.m',szFileName),'w');
fprintf(fid, '%% Script to do something usefull (fill out)\n');
fprintf(fid, '%% Author: %s (c) IHA @ Jade Hochschule applied licence see EOF \n',szAuthor);
fprintf(fid, '%% Version History:\n');
fprintf(fid, '%% Ver. 0.01 initial create (empty) %s \t\t\t Initials (eg. JB)\n',date);
fprintf(fid, '\n');

fprintf(fid, 'clear;\nclose all;\nclc;\n');
fprintf(fid, '\n');
fprintf(fid, '%%------------Script implementation-------- \n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '%%--------------------Licence ---------------------------------------------\n');
szYear = date;
szYear(1:end-4) = [];
fprintf(fid, '%% Copyright (c) <%s> %s\n',szYear,szAuthor);
fprintf(fid, '%% Institute for Hearing Technology and Audiology\n%% Jade University of Applied Sciences \n');
fprintf(fid, '%% Permission is hereby granted, free of charge, to any person obtaining \n%% a copy of this software and associated documentation files \n%% (the "Software"), to deal in the Software without restriction, including \n%% without limitation the rights to use, copy, modify, merge, publish, \n%% distribute, sublicense, and/or sell copies of the Software, and to\n%% permit persons to whom the Software is furnished to do so, subject\n%% to the following conditions:\n');
fprintf(fid, '%% The above copyright notice and this permission notice shall be included \n%% in all copies or substantial portions of the Software.\n');
fprintf(fid, '%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, \n%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \n%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. \n%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY \n%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, \n%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE \n%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.');

fclose (fid);

edit(szFileName);

%--------------------Licence ---------------------------------------------
% Copyright (c) <2011> Joerg Bitzer
% Institute for Hearing Technology and Audiology
% Jade University of Applied Sciences Oldenburg 
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, including 
% without limitation the rights to use, copy, modify, merge, publish, 
% distribute, sublicense, and/or sell copies of the Software, and to 
% permit persons to whom the Software is furnished to do so, subject 
% to the following conditions:
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

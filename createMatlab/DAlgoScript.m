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

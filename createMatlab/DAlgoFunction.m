function newFunction(szFileName,szAuthor, bGenTestScript)
% function to create two new m files with all relevant documentation (to be filled)
% Usage: newFunctionAndTester(szFileName,szAuthor, bGenTestScript)
% Input parameter:
%       szFileName:     Name of new m-files without extension and Test (.m)
%       szAuthor:       Name of Author
%       bGenTestScript: switch to generate a tester file automatically
%                       (default = 1, therefore a test script is generated)
% Output parameter:
%       None
% Output:
%    one or two new m files (Function and Tester (if desired)) with comments but no functionality
% ------------------------------------------------------------------------
% Example: newFunction('computeSNR','J. Bitzer');
% Example: newFunction('SNR = computeSNR(signal,noise)','J. Bitzer');

% Author: J. Bitzer (c) TGM @ Jade Hochschule applied licence see EOF
% Co-Author: Stephanus Volke (c) Jade Hochschule applied licence see EOF
% Version History:
% Ver. 0.01 initial create (empty) 14-Apr-2011 JB
% Ver. 1.0  implemented and tested 14-Apr-2011 JB
% Ver. 1.1  Added automatic opening of editor and example in comment block
%                                  12.Jul-2011 JB
% Ver. 2.0  Merging Function and Tester generation into one File
%                                  14-May-2013 SV
% Ver. 2.1  Renaming and switch for tester function included, add fuction
% call in test script              01-Oct-2013 JB
% Ver. 2.2  Allowing function signaltures in szFileName (if given, the 
% signalture is used without spaces) 23- Sep.2014 JB
% Ver. 2.3 Updated the input possibilities (author default for AT2) AT2
% Ver. 3.0 given signature is used to provide the basic input/output
% parameter description              29-Oct-2014  AT2
% Ver. 3.1 edited the possible input parameters for the newFunction
% call(you can generate a testscript without editing the author)
% 29-Oct-2014 AT2
% Ver. 3.2 changed the default author for the DAlgo project 18-Apr-2015 AT3

%                                  
if nargin < 3 
    if nargin <2
        szAuthor = 'Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn';
    end
    if szAuthor == 1
       bGenTestScript = 1;
       szAuthor = 'Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn';
    else
        bGenTestScript = 0;
    end
end

% Remove Spaces
idxSpaces = strfind(szFileName,' ');
szFileName(idxSpaces) = [];

% Extract function signature if given 
idxEqualSign = strfind(szFileName,'=');
idxOpenBracked = strfind(szFileName,'(');
idxCloseBracked = strfind(szFileName,')');
idxOpenHardBracked = strfind(szFileName,'[');
idxCloseHardBracked = strfind(szFileName,']');
idxComma = strfind(szFileName,',');%all the commas
idxCommaOutput= [];
idxCommaInput= [];

for kk = 1:length(idxComma)%seperate the commas into output and input commas 
    if idxComma(kk)< idxEqualSign
        idxCommaOutput(kk) = idxComma(kk);
    else
        idxCommaInput(kk-length(idxCommaOutput)) = idxComma(kk);
    end
end


if isempty(idxEqualSign)
    szFunctionReturn = which(szFileName);
else
    szFunctionReturn = which(szFileName(idxEqualSign+1:idxOpenBracked-1));
end
if bGenTestScript
    if isempty(idxEqualSign)
        szTestReturn = which([szFileName,'Test']);
    else
        szTestReturn = which([szFileName(idxEqualSign+1:idxOpenBracked-1),'Test']);
    end
end

if ~isempty(szFunctionReturn)
    error(sprintf('function exists in matlab path, see %s',szFunctionReturn));
    %error('function or script with the same name exists in matlab path\n, see %s',szFunctionReturn);
end
if bGenTestScript
    if ~isempty(szTestReturn)
        %    error(sprintf('function exists in matlab path, see %s',szTestReturn));
        error('test script with the same name exists in matlab path\n, see %s',szTestReturn);
    end
end
if isempty(idxEqualSign) % generate standard signature
    fid = fopen(sprintf('%s.m',szFileName),'w');
    fprintf(fid, 'function [out_param] = %s(in_param)\n',szFileName);
else % generate signature as given
    fid = fopen(sprintf('%s.m',szFileName(idxEqualSign+1:idxOpenBracked-1)),'w');
    fprintf(fid, 'function %s\n',szFileName);
end
fprintf(fid, '%% function to do something usefull (fill out)\n');
if isempty(idxEqualSign) % generate standard signature
    fprintf(fid, '%% Usage [out_param] = %s(in_param)\n',szFileName');
else
    fprintf(fid, '%% Usage %s\n',szFileName');
end

fprintf(fid, '%% Input Parameter:\n');
if isempty(idxCommaInput)%generate individual input parameter
    fprintf(fid, '%%\t in_param: \t\t Explain the parameter, default values, and units\n');
else
    %first input parameter
    fprintf(fid, '%%\t %s: \t\t Explain the parameter, default values, and units\n',szFileName(idxOpenBracked+1:idxCommaInput(1)-1));
    for kk = 1:length(idxCommaInput)-1%input parameters in the middle
        fprintf(fid, '%%\t %s: \t\t Explain the parameter, default values, and units\n',szFileName(idxCommaInput(kk)+1:idxCommaInput(kk+1)-1));
    end
    %last input parameter
    fprintf(fid, '%%\t %s: \t\t Explain the parameter, default values, and units\n',szFileName(idxCommaInput(length(idxCommaInput))+1:idxCloseBracked-1));
end

fprintf(fid, '%% Output Parameter:\n');
if isempty(idxCommaOutput)%gererate individual output parameters
    if isempty(idxEqualSign)
        fprintf(fid, '%%\t out_param: \t Explain the parameter, default values, and units\n');
    elseif isempty(idxOpenHardBracked)
        fprintf(fid, '%%\t %s: \t Explain the parameter, default values, and units\n',szFileName(1:idxEqualSign-1));
    else
        fprintf(fid, '%%\t %s: \t Explain the parameter, default values, and units\n',szFileName(idxOpenHardBracked+1:idxCloseHardBracked-1));
    end
else
    %first output parameter
    fprintf(fid, '%%\t %s: \t\t Explain the parameter, default values, and units\n',szFileName(idxOpenHardBracked+1:idxCommaOutput(1)-1));
    for kk = 1:length(idxCommaOutput)-1%output parameters in the middle
        fprintf(fid, '%%\t %s: \t\t Explain the parameter, default values, and units\n',szFileName(idxCommaOutput(kk)+1:idxCommaOutput(kk+1)-1));
    end
    %last output parameter
    fprintf(fid, '%%\t %s: \t\t Explain the parameter, default values, and units\n',szFileName(idxCommaOutput(length(idxCommaOutput))+1:idxCloseHardBracked-1));
end

fprintf(fid, '%%------------------------------------------------------------------------ \n');
fprintf(fid, '%% Example: Provide example here if applicable (one or two lines) \n');
fprintf(fid, '\n');
fprintf(fid, '%% Author: %s (c) TGM @ Jade Hochschule applied licence see EOF \n',szAuthor);
fprintf(fid, '%% Source: If the function is based on a scientific paper or a web site, \n');
fprintf(fid, '%%         provide the citation detail here (with equation no. if applicable)  \n');
fprintf(fid, '%% Version History:\n');
fprintf(fid, '%% Ver. 0.01 initial create (empty) %s  Initials (eg. JB)\n',date);
fprintf(fid, '\n');
fprintf(fid, '%%------------Function implementation--------------------------- \n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '%%--------------------Licence ---------------------------------------------\n');
szYear = date;
szYear(1:end-4) = [];
fprintf(fid, '%% Copyright (c) <%s> %s\n',szYear,szAuthor);
fprintf(fid, '%% Jade University of Applied Sciences \n');
fprintf(fid, '%% Permission is hereby granted, free of charge, to any person obtaining \n%% a copy of this software and associated documentation files \n%% (the "Software"), to deal in the Software without restriction, including \n%% without limitation the rights to use, copy, modify, merge, publish, \n%% distribute, sublicense, and/or sell copies of the Software, and to\n%% permit persons to whom the Software is furnished to do so, subject\n%% to the following conditions:\n');
fprintf(fid, '%% The above copyright notice and this permission notice shall be included \n%% in all copies or substantial portions of the Software.\n');
fprintf(fid, '%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, \n%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \n%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. \n%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY \n%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, \n%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE \n%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.');

fclose (fid);
if bGenTestScript
    if isempty(idxEqualSign) % generate standard signature
        fid = fopen(sprintf('%s.m',[szFileName,'Test']),'w');
        fprintf(fid, '%% Script to test the function %s.m \n',szFileName);
    else
        fid = fopen(sprintf('%s.m',[szFileName(idxEqualSign+1:idxOpenBracked-1),'Test']),'w');
        fprintf(fid, '%% Script to test the function %s.m \n',szFileName(idxEqualSign+1:idxOpenBracked-1));
    end
    fprintf(fid, '%% Author: %s (c) TGM @ Jade Hochschule applied licence see EOF \n',szAuthor);
    fprintf(fid, '%% Version History:\n');
    fprintf(fid, '%% Ver. 0.01 initial create (empty) %s \t\t\t Initials (eg. JB)\n',date);
    fprintf(fid, '\n');
    
    fprintf(fid, 'clear;\nclose all;\nclc;\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%------------Script implementation-------- \n');
    fprintf(fid, '\n');
    fprintf(fid, '%%Define your parameters and adjust your function call\n');
    if isempty(idxEqualSign) % generate standard signature
        fprintf(fid, '[out_param] = %s(in_param);\n',szFileName);
    else
        fprintf(fid, '%s;\n',szFileName);
    end
    fprintf(fid, '\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%--------------------Licence ---------------------------------------------\n');
    szYear = date;
    szYear(1:end-4) = [];
    fprintf(fid, '%% Copyright (c) <%s> %s\n',szYear,szAuthor);
    fprintf(fid, '%% Jade University of Applied Sciences \n');
    fprintf(fid, '%% Permission is hereby granted, free of charge, to any person obtaining \n%% a copy of this software and associated documentation files \n%% (the "Software"), to deal in the Software without restriction, including \n%% without limitation the rights to use, copy, modify, merge, publish, \n%% distribute, sublicense, and/or sell copies of the Software, and to\n%% permit persons to whom the Software is furnished to do so, subject\n%% to the following conditions:\n');
    fprintf(fid, '%% The above copyright notice and this permission notice shall be included \n%% in all copies or substantial portions of the Software.\n');
    fprintf(fid, '%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, \n%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \n%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. \n%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY \n%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, \n%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE \n%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.');
    
    fclose (fid);
    if isempty(idxEqualSign) % generate standard signature
        edit([szFileName,'Test']);
    else
        edit([szFileName(idxEqualSign+1:idxOpenBracked-1),'Test']);
    end
end
if isempty(idxEqualSign) % generate standard signature
    edit(szFileName);
else
    edit(szFileName(idxEqualSign+1:idxOpenBracked-1));
end


%--------------------Licence ---------------------------------------------
% Copyright (c) <2011-2013> J. Bitzer, S. Volke
% Institute for Hearing Technology and Audiology
% Jade University of Applied Sciences
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

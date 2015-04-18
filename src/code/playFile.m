function []=playFile(filedir)
% playFile plays the wav File with the name given in filedir
% Usage []=playFile(filedir)
% Input Parameter:
%	 filedir:	String, inherits the direction and the name of the playable file

%------------------------------------------------------------------------ 
% Example: playFile('test') -> plays the wavFile with the name test.wav 
%          playFile('direction/test') -> plays the test.wav file in the
%          direction direction

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  Initials (eg. JB)
% Ver. 1.0 implemented code 18-Apr-2015 (FB,KH,SW)

%------------Function implementation--------------------------- 

%read the audiofile
[y,fs]=audioread([filedir '.wav']);
%initialize a audioplayer object
player = audioplayer(y,fs);
%play the audiofile
play(player);

%pause to play the wav file properly. Otherwise the objects gets deleted
%after the end of the function
lenSecOfWav = player.TotalSamples/player.SampleRate; %Length of wav file in seconds
pause(lenSecOfWav)


end
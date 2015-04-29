function []=playFile(filedir)
% playFile plays the wav File with the name given in filedir
% Usage []=playFile(filedir)
% Input Parameter:
%	 filedir:	String, contains the direction and the name of the playable file
%------------------------------------------------------------------------ 
% Example: playFile('test') -> plays the wavFile with the name test.wav 
%          playFile('dir/test') -> plays the test.wav file in the
%          direction dir

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  Initials (eg. JB)
% Ver. 1.0 implemented code 18-Apr-2015 (FB,KH,SW)
% Ver. 1.1 updated documentation 29-Apr-2015 (FB,KH,SW)

%------------Function implementation--------------------------- 

%read the audiofile
[y,fs]=audioread([filedir '.wav']);
%initialize a audioplayer object
player = audioplayer(y,fs);
%play the audiofile
play(player);

%pause to play the wav file properly. Otherwise the objects gets deleted
%after call of the play function before the sound was played succesfully
lenSecOfWav = player.TotalSamples/player.SampleRate; %Length of wav file in seconds
pause(lenSecOfWav)


end
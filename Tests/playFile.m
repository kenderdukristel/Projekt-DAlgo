function []=playFile(filedir)
% playFile plays the wav File with the name given in filedir
% Usage []=playFile(filedir)
% Input Parameter:
%	 filedir:	String, inherits the direction of the playable file

%------------------------------------------------------------------------ 
% Example: playFile('test') -> plays the wavFile with the name test.wav 
%          playFile('direction/test') -> plays the test.wav file in the
%          direction direction

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015  Initials (eg. JB)

%------------Function implementation--------------------------- 


[y,fs]=audioread([filedir '.wav']);
disp(fs)
player = audioplayer(y,fs);
disp(player)
play(player);



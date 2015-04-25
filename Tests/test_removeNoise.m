function test_removeNoise(audiofileName)
% function to do something usefull (fill out)
% Usage [out_param] = test_removeNoise(in_param)
% Input Parameter:
%	 in_param: 		 Explain the parameter, default values, and units
% Output Parameter:
%	 out_param: 	 Explain the parameter, default values, and units
%------------------------------------------------------------------------ 
% Example: Provide example here if applicable (one or two lines) 

% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Source: http://stackoverflow.com/questions/24195089/remove-noise-from-wav-file-matlab

% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2015  Initials (eg. JB)

%------------Function implementation--------------------------- 

[sig,fs] = audioread(['../TIMIT MIT/dr1-fvmh0/' audiofileName]);


%sound(sig,fs);
sigOrg = audioplayer(sig,fs);
disp(sigOrg);

%figure;
%plot(sig(:));
FFTLen = 2048;
DataLen = 512;
Overlap = 0.5*DataLen;
spectrogram(sig,DataLen,Overlap,FFTLen,fs,'yaxis'); 

n = 7;
beginFreq = 150 / (fs/2);
endFreq = 350 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
sig_filter = filter(b, a, sig);

sound(sig_filter,fs);

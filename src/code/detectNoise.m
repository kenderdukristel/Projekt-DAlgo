function noiseDetected = detectNoise(fileName)
% function to detect if there is noise in an audiofile
% Usage noiseDetected = detectNoise(fileName)
% Input Parameter:
%	 fileName:          name of the audiofile, that shall be tested
% Output Parameter:
%	 noiseDetected:     returns 1, if noise is detected
%                       returns 0, if no noise is detected
%------------------------------------------------------------------------ 
% Example: noiseDetected = detectNoise('TIMIT MIT/dr1-mcpm0/sa1') 

% Author: Finn Bayer, Kristin Hasselbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
  
% Version History:
% Ver. 0.01 initial create (empty) 29-Apr-2015  (FB,KH,SW)
% Ver. 1.00 first implementation 29-Apr-2015  (FB,KH,SW)

%------------Function implementation--------------------------- 

%read audiofile
[sig,fs] = audioread([fileName '.wav']);

%calculated power density spectrum
FFTLen = 2048;
DataLen = 512;
Overlap = 0.5*DataLen;
LDS = pwelch(sig,DataLen,Overlap,FFTLen);

%find maximum value of the power density spectrum in db
maxPeak = 20*log10(max(findpeaks(LDS)));

%if there is noise, the maximum is above approx. -40 dB
threshold = -40;

%compare maximum with threshold and define return value
if maxPeak > threshold
    noiseDetected = 1;
else
    noiseDetected = 0;
end




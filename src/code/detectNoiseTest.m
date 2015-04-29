% Script to test the function detectNoise.m 
% Author: Finn Bayer, Kristin Hasselbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2015 	(FB,KH,SW)
% Ver. 1.00 first implementation 29-Apr-2015  (FB,KH,SW)

clear;
close all;
clc;

%------------Script implementation-------- 

%name of file
filename = 'dr1-fvmh0\sa1.wav';

%call function
noise = detectNoise(filename);

%test
assert(noise==1,'Noise detection did not work')
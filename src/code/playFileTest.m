% Script to test the function playFile.m 
% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015 	(FB,KH,SW)
% Ver. 1.0 code implemented 18-Apr-2015 (FB,KH,SW)

clear;
close all;
clc;

%------------Script implementation--------

%test file direction and name
filedir = '../../TIMIT MIT/dr1-fvmh0/sa1';

%open playFile with filedir-parameter
playFile(filedir)


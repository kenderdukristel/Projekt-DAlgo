% Script to test the function fileSearch.m 
% Author: Finn Bayer, Kristin Haﬂelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015 	(FB,KH,SW)

clear;
close all;
clc;

%------------Script implementation-------- 

%string oder 0
id = 'vmh0';
sen = 0;
word = 'suit';
phon = 0;

%call function
fileNames = fileSearch(id, sen, word, phon);
%testing the function with expectedResult
expectedResult = {'dr1-fvmh0/sa1'};
assert(isempty(setxor(fileNames,expectedResult))==1,'Function fileSearch gives wrong result')


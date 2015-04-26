% Script to test the function fileSearch.m 
% Author: Finn Bayer, Kristin Haﬂelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015 	KH

clear;
close all;
clc;

%------------Script implementation-------- 

%string oder 0
id = 0;
sen = 0;
word = 'cpm0';
phon = 0;

%call function
fileNames = fileSearch(id, sen, word, phon);

disp(fileNames)


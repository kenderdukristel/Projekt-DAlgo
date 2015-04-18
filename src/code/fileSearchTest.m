% Script to test the function fileSearch.m 
% Author: Finn Bayer, Kristin Haßelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 18-Apr-2015 			 Initials (eg. JB)

clear;
close all;
clc;

%------------Script implementation-------- 

%string oder 0
id = 'cpm0';
sen = 0;
word = 'suit';
phon = 0;

%call function
fileNames = fileSearch(id, sen, word, phon);

disp(fileNames)


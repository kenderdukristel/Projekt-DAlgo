% Script to test the function callFileSearch.m 
% Author: Finn Bayer, Kristin Haﬂelbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2015 	KH

clear;
close all;
clc;

%------------Script implementation-------- 

%parameter
typePar = 'id';
par = 'cpm0';

%call function
fileNames = callFileSearch(typePar,par);

disp(fileNames)

clc;clear;
close all;

 load('pts.mat');

im = imread('r=10,55075.jpg');
r= 2;

% [segmIm, labels, peaks] = imSegment(im,r,'5D');
% [peak,cpts] = findpeak_opt(data,mean_matrix,r)
[labels,peaks] = meanshift_opt(data,r)

%--------------------------------------------------------------------------
% Module: main.m
% Usage: Main MATLAB code for Project 1. 
%
% Purpose: <FILL IN PURPOSE>
%
% Input Variables:
%   disks.jpg       the input image 
%
% Returned Results:
% <ADD RESULTS>
%
% Processing Flow:
% <ADD Process Flow>
%
%
% See also:
% <Add Helper Functions>
%
% Authors: Piyush Nagasubramaniam
% Date: 01/25/2023
%--------------------------------------------------------------------------
clear;

% Read image and make it grayscale binary
im = imread('disks.jpg');
im1 = rgb2gray(im);
im1 = threshold(im1, 10);

% Perform the close operation to eliminate 
% salt and pepper noise
se1 = strel('square', 3);
sel1 = se1.getnhood();
im1 = dilate(im1, sel1);
im1 = erode(im1, sel1);


% se2 = strel('disk', 9);
% sel2 = se2.getnhood();
% im2 = erode(im1, sel2);
im2 = hm_transform(im1);
imtool(im1);
imtool(im2);
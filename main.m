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
im1 = threshold(im1, 9);

% Perform the close operation to eliminate 
% salt and pepper noise
se1 = strel('square', 3);
sel1 = se1.getnhood();
im1 = dilate(im1, sel1);
im1 = erode(im1, sel1);

% Apply hit/miss transform to first detect
% middle-size disks
im2 = hm_transform(im1);
imtool(im1);
imtool(im2);

% Reconstructing image after hit/miss transform
im3 = reconstruct(im2, im1);
imtool(im3);

% Subtract resultant image from im1 to retain
% largest and smallest disks
im4 = ~(im1/255)*255 - ~(im3/255)*255;
im4 = uint8(invert(im4));
imtool(im4);
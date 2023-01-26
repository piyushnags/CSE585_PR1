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
im1 = dilate(im1, 'square', 3);
im1 = erode(im1, 'square', 3);

imtool(im1);
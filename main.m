%--------------------------------------------------------------------------
% Module: main.m
% Usage: Main MATLAB code for Project 1. 
%
% Purpose: Hit/miss transform implementation to detect shapes
%          of different sizes
%
% Input Variables:
%   disks.jpg       the input image 
%
% Returned Results:
%   1. disks_clean.png      Noise-free version of input
%   2. disks_hm.png         Result of applying hit/miss 
%                           transform
%   3. disks_middle.png     Reconstructed image containing 
%                           middle-sized disks
%   4. disks_sl.png         Final result containing only 
%                           smallest and largest disks
%
% Processing Flow:
%   1. Convert the color image to a grayscale binary image
%   2. Eliminate noise from image 
%   3. Apply hit/miss transform
%   4. Reconstruct result of hit/miss transform
%   5. Postprocess results
%
% See also:
%   1. erode.m          Function to erode an image given a structuring
%                       element (as an array)
%   2. dilate.m         Function to dilate an image given a structuring
%                       element (as an array)
%   3. hm_transform.m   Function to apply hit/miss transform to find middle
%                       sized disks
%   4. invert.m         Helper function to flip the FG and BG
%   5. reconstruct.m    Helper function to reconstruct an image using
%                       conditional dilation
%
% Authors: Piyush Nagasubramaniam, Siyuan Hong, Jacky Lin
% Date: 01/25/2023
%--------------------------------------------------------------------------
clear;

% Read image and make it grayscale binary
im = imread('disks.jpg');
im1 = rgb2gray(im);
im1 = threshold(im1, 15);
imtool(im1);
imwrite(im1, 'output/disks_threshold.png', 'png');

% Perform the close operation to eliminate 
% salt and pepper noise
se1 = strel('square', 3);
sel1 = se1.getnhood();
im1 = dilate(im1, sel1);
im1 = erode(im1, sel1);
imtool(im1);
imwrite(im1, 'output/disks_clean.png', 'png');

% Apply hit/miss transform to first detect
% middle-size disks

% Initialize structuring elements as logical arrays
se2 = strel('disk', 9);
A = se2.getnhood();
se3 = strel('disk', 30);
B = se3.getnhood();
B = invert(B);
B = logical(B/255);

% Call hit/miss transform function
im2 = hm_transform(im1, A, B);
imtool(im2);
imwrite(im2, 'output/disks_hm.png', 'png');

% Reconstructing image after hit/miss transform
im3 = reconstruct(im2, im1);
imtool(im3);
imwrite(im3, 'output/disks_middle.png', 'png');

% Subtract resultant image from im1 to retain
% largest and smallest disks
im4 = invert(im1) - invert(im3);
im4 = uint8(invert(im4));
imtool(im4);
imwrite(im4, 'output/disks_sl.png', 'png');
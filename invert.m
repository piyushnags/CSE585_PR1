%--------------------------------------------------------------------------
% Module: invert.m
% Usage: MATLAB function to invert a binary image (uint8)
% Purpose: < FILL in Purpose >
%
% Input Variables:
%   f       input image array
%
% Returned Results:
%   out     output image array
%
% Processing Flow:
% < FILL IN PROCESSING FLOW >
%
% Author: Piyush Nagasubramaniam, Siyuan Hong, Jacky Lin
% Date: 01/25/2023
%--------------------------------------------------------------------------
function [out] = invert(f)

[M, N] = size(f);

for x = 1:M
    for y = 1:N
        out(x,y) = ~(f(x,y)/255)*255;
    end
end

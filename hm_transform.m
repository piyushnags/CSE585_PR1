%--------------------------------------------------------------------------
% Module: hm_transform.m
% Usage: MATLAB function to perform hit/miss transform
% Purpose: < FILL in Purpose >
%
% Input Variables:
%   f       input image array
%   A       Structuring element for hit
%   B       Structuring element for miss
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
function [out] = hm_transform(f)

% Get the image background i.e. X complement
f_ = invert(f);

se = strel('disk', 9);
sel = se.getnhood();
sel_ = invert(sel);

h = erode(f, sel);
m = erode(f_, sel_);

[M, N] = size(h);
for x = 1:M
    for y = 1:N
        if h(x,y)*m(x,y) == 0
            out(x,y) = 0;
        else
            out(x,y) = 255;
        end
    end
end

out = uint8(out);


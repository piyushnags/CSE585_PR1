%--------------------------------------------------------------------------
% Module: dilate.m
% Usage: MATLAB function to perform morphological dilation
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

% TODO: Add support for asymmetric structuring elements
% Note: Implementation for non-standard structuring elements already
% implemented. Just need to write a function to reflect the logical
% array.

function [out] = dilate(f, sel)

[M, N] = size(f);
% se = strel(shape, g);
% sel = se.getnhood();

% Set background value to WHITE (255)
for x = 1:M
    for y = 1:N
        out(x,y) = 255;
    end
end

% Get size of structuring element
[P, Q] = size(sel);

% Choose valid bounds when iterating
% through the image
xlo = 1 + (P-1)/2;
xhi = M - (P-1)/2;
ylo = 1 + (Q-1)/2;
yhi = N - (Q-1)/2;

% Iterate through the image
for x = xlo:xhi
    for y = ylo:yhi
        s = 0;
        
        for i = -((P-1)/2):((P-1)/2)
            for j = -((Q-1)/2):((Q-1)/2)
                if ~(f(x+i, y+j)/255)*sel(i+1+((P-1)/2), j+1+((P-1)/2))==1
                    s = s + 1;
                end
            end
        end

        if s ~= 0
            out(x,y) = 0;
        else
            out(x,y) = 255;
        end

    end
end

out = uint8(out);

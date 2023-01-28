%--------------------------------------------------------------------------
% Module: reconstruct.m
% Usage: reconstruct(f1, f2)
% Purpose: Helper function to reconstruct the result of hit/miss transform
%          due to shrinkage
%
% Input Variables:
%   f1       input image array
%   f2       reference for reconstruction
%
% Returned Results:
%   out     output image array
%
% Processing Flow:
%   1. Initialize structuring element disk of radius 1 for 
%      reconstruction. Choosing a small size for faster implementation.
%   2. Iteratively dilate input f1. Then, perform intersection with 
%      reference image to store result for future iteration.
%   3. Compare current iteration's result against the previous result 
%      (initially zeroed out). If it is same, then end loop, else continue
%   4. Convert output to uint8.
%
% Author: Piyush Nagasubramaniam, Siyuan Hong, Jacky Lin
% Date: 01/25/2023
%--------------------------------------------------------------------------
function [res] = reconstruct(f1, f2)

flag = 1;

% Initialize structuring element for reconstruction
se = strel('disk',1);
sel = se.getnhood();

% Get dimensions for iterating over image
[M, N] = size(f1);

% Initialize res for storing results of current iteration
% and res_prev for storing results of previous iterations
res = zeros(M,N);
res_prev = zeros(M,N);

% Begin Loop
while flag
%   Dilate  
    f1 = dilate(f1, sel);
    
%   Get intersection of dilated f1 and store the intersection with
%   reference as result of current iteration
    for x = 1:M
        for y = 1:N
            if (f1(x,y) == 0) && (f2(x,y) == 0)
                res(x,y) = 0;
            else
                res(x,y) = 255;
            end
        end
    end

%   Compare result of current iteration with prevoius iteration.
%   If result is same in consecutive iterations, terminate the loop.
    if isequal(res, res_prev)
        flag = 0;
    else
        res_prev = res;
        f1 = res;
    end
end

res = uint8(res);


%--------------------------------------------------------------------------
% Module: reconstruct.m
% Usage: MATLAB function to reconstruct shrunk image
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
function [res] = reconstruct(f1, f2)

flag = 1;
se = strel('disk',1);
sel = se.getnhood();
[M, N] = size(f1);
res = zeros(M,N);
res_prev = zeros(M,N);

while flag 
    f1 = dilate(f1, sel);
    
    for x = 1:M
        for y = 1:N
            if (f1(x,y) == 0) && (f2(x,y) == 0)
                res(x,y) = 0;
            else
                res(x,y) = 255;
            end
        end
    end

    if isequal(res, res_prev)
        flag = 0;
    else
        res_prev = res;
        f1 = res;
    end
end

res = uint8(res);


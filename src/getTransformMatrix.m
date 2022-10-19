function transformMatrix = getTransformMatrix(blkSize, samplePos)
% Get the DCT tranform matrix from original matrix and samples
%
% INPUT:
%   blkSize: block size
%   samplePos: position of samples (sample size * 2)
%
% OUTPUT:
%   transformMatrix: DCT tranform matrix

sampleSize = size(samplePos, 1);
P = blkSize; Q = blkSize;
transformMatrix = zeros(sampleSize, P * Q);
for i = 1: sampleSize
    xi = samplePos(i, 1);
    yi = samplePos(i ,2);
    for u = 1: blkSize
        if u == 1
            au = sqrt(1/P);
        else 
            au = sqrt(2/P);
        end
        for v = 1: blkSize
            if v == 1
                bv = sqrt(1/Q);
            else 
                bv = sqrt(2/Q);
            end
            index = (u - 1) * blkSize + v;
            transformMatrix(i, index) = au * bv * cos(pi * (2*xi-1) * (u-1) /2/P) * cos(pi * (2*yi-1) * (v-1) /2/Q);
        end
    end
end


end
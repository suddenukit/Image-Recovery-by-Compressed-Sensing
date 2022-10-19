function samplePos = getSample(sampleSize, blkSize)
% show get specified number of samples in a matrix
%
% INPUTS:
%   sampleSize: number of samples
%   blkSize: size of square matrix
sampleIndex = randperm(blkSize * blkSize, sampleSize); % 1 to 64, this will be converted to coordination. 
samplePos = zeros(sampleSize, 2);
for i = 1: sampleSize
    samplePos(i, 1) = fix((sampleIndex(i)-1)/ blkSize)+1;
    samplePos(i, 2) = mod(sampleIndex(i), blkSize)+1;
end
end
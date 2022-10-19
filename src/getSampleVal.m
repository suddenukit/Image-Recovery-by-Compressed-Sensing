function sampleVal = getSampleVal(samplePos, curMatrix)
% Get the value of samples based on their positions.
%
% INPUT:
%   samplePos: input sample position
%   curMatrix: The matrix block of pixel values
%   numSample: Number of samples
%
% OUTPUT:
%   sampleVal: the pixel values of samples
numSample = size(samplePos, 1);
sampleVal = zeros(numSample, 1);
for i = 1: numSample
    sampleVal(i, 1) = curMatrix(samplePos(i, 1), samplePos(i, 2));
end
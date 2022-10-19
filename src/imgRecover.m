function imgOut = imgRecover(imgIn, blkSize, numSample)
% Recover the input image from a small size samples
%
% INPUT:
%   imgIn: input image
%   blkSize: block size
%   numSample: how many samples in each block
%
% OUTPUT:
%   imgOut: recovered image after median filtering

[row,col]=size(imgIn);
trainingTimes = 20; % Repeat the training-and-test process for 20 times in each block.
inputBlocks = seperateBlock(imgIn, blkSize, row, col);
blockRow = row/blkSize;
blockCol = col/blkSize;
totalIndex = blockRow * blockCol;
myRecovery = zeros(blkSize, blkSize, totalIndex);

parfor i = 1:totalIndex
    originBlock = inputBlocks(:,:,i);
    allPos = getAllPos(blkSize);
    recoverMatrix = getTransformMatrix(blkSize, allPos);
    samplePos = getSample(numSample, blkSize);
    sampleVal = getSampleVal(samplePos, originBlock);
    lambda = trainValidation(blkSize, samplePos, sampleVal, trainingTimes);
    A = getTransformMatrix(blkSize, samplePos);
    alpha = OMP(A, sampleVal, lambda);
    recoveredVal = recoverMatrix * alpha;
    currMatrix = reshape(recoveredVal, blkSize, blkSize)';
    myRecovery(:,:,i) = currMatrix; 
    
end
imgOut = combineBlocks(myRecovery, blkSize, row, col);
  
end
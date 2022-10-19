boat = imgRead('boat.bmp');
[row,col]=size(boat);
numSample = 40; % Number of samples per block.
blkSize = 8; % 8*8 block
trainingTimes = 20; % Repeat the training-and-test process for 20 times in each block.
myRecovery = zeros(row, col);
for i = 1: blkSize: row
    for j = 1: blkSize: col 
        originBlock = boat(i:i+blkSize-1, j:j+blkSize-1);
        allPos = getAllPos(blkSize);
        recoverMatrix = getTransformMatrix(blkSize, allPos);
        samplePos = getSample(numSample, blkSize);
        sampleVal = getSampleVal(samplePos, originBlock);
        lambda = trainValidation(blkSize, samplePos, sampleVal, trainingTimes);
        A = getTransformMatrix(blkSize, samplePos);
        alpha = OMP(A, sampleVal, lambda);
        recoveredVal = recoverMatrix * alpha;
        currMatrix = reshape(recoveredVal, 8, 8)';
        myRecovery(i:i+blkSize-1, j:j+blkSize-1) = currMatrix;       
    end
end
% Median filter
% Compare the error of the recovered image w/ MF and w/o MF

filteredResult = medfilt2(myRecovery);
imgShow(filteredResult);
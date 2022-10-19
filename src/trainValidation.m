function bestLambda = trainValidation(blkSize, samplePos, sampleVal, trainingTimes)
% Get the best fitted Matrix block after training and cross validation
%
% INPUT:
%   blkSize: size of blocks
%   samplePos: input sample position
%   sampleVal: pixel values of the samples
%   trainingTimes: time of training
%
% OUTPUT:
%   bestFitMatrix: the best fitted Matrix block (lambda gives minimum MSE)
bestLambda = 1;
bestMSE = intmax;
sampleSize = size(samplePos, 1);
m = floor(sampleSize/6);
for lambda = 1: sampleSize
    totalMSE = 0;
    for i = 1: trainingTimes
        [trainPos, validationPos, trainVal, validationVal] = devideSample(m, samplePos, sampleVal);
        A = getTransformMatrix(blkSize, trainPos);
        alpha = OMP(A, trainVal, lambda);
        recoverMatrix = getTransformMatrix(blkSize, validationPos);
        recoveredVal = recoverMatrix * alpha; % Recover to the validation samples.
        totalMSE = totalMSE + immse(recoveredVal, validationVal);
    end
    averageMSE = totalMSE/trainingTimes;
    if averageMSE < bestMSE
        bestMSE = averageMSE;
        bestLambda = lambda;
    end
end
%disp(bestLambda);
end
function [trainSet, validationSet, trainVal, validationVal] = devideSample(m, samplePos, sampleVal)
% Get the best fitted Matrix block after training and cross validation
%
% INPUT:
%   m: size of validationSet
%   samplePos: input sample position
%   sampleVal: value of the samples
%
% OUTPUT:
%   trainSet: positions of training set
%   validationSet: positions of validation set
%   trainVal: values of training set
%   validationVal: values of validation set

numSample = size(sampleVal, 1);
randRows = randperm(numSample);
randRows = randRows(1:m);
validationSet = samplePos(randRows, :);
validationVal = sampleVal(randRows, :);
trainSet = samplePos;
trainVal = sampleVal;
trainSet(randRows,:) = [];
trainVal(randRows,:) = [];
end
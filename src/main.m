tic;
boat = imgRead('boat.bmp');
numSample = 64; % Number of samples per block.
blkSize = 8; % 8*8 block
boatOutput = imgRecover(boat, blkSize, numSample);
errorBeforeFilter = immse(boatOutput, boat);
disp(['MSE before filtering for boat: ' num2str(errorBeforeFilter)]);
filteredBoat = medfilt2(boatOutput);
errorAfterFilter = immse(filteredBoat, boat);
disp(['MSE after filtering for boat: ' num2str(errorAfterFilter)]);
imgShow(filteredBoat);
toc;
disp(['Run time of boat: ',num2str(toc)]);

tic;
nature = imgRead('nature.bmp');
numSample = 36; % Number of samples per block.
blkSize = 8; %  block size can be changed
natureOutput = imgRecover(nature, blkSize, numSample);
errorBeforeFilter = immse(natureOutput, nature);
disp(['MSE before filtering for nature: ' num2str(errorBeforeFilter)]);
filteredNature = medfilt2(natureOutput);
errorAfterFilter = immse(filteredNature, nature);
disp(['MSE after filtering: ' num2str(errorAfterFilter)]);
imgShow(filteredNature);
toc;
disp(['Run time of nature: ',num2str(toc)]);
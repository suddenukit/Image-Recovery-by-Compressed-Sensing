function combinedBlock = combineBlocks(blocks, blkSize, row, col)
% Combine the 3d block sequence to a 2d big matrix
%

combinedBlock = zeros(row, col);
blockRow = row/blkSize;
blockCol = col/blkSize;
totalIndex = blockRow * blockCol;
for i = 1: totalIndex
    currRow = floor((i-1)/blockCol) * blkSize + 1;
    currCol = (mod(i-1,blockCol)) * blkSize + 1;
    combinedBlock(currRow:currRow+blkSize-1, currCol:currCol+blkSize-1) = blocks(:,:,i);
end

end

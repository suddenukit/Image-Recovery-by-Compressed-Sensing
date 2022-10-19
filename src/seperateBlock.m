function seperatedBlocks = seperateBlock(imgIn, blkSize, row, col)
% Seperate the 2D large matrix to 3D block sequence
%

blockRow = row/blkSize;
blockCol = col/blkSize;
totalIndex = blockRow * blockCol;
seperatedBlocks = zeros(blkSize, blkSize, totalIndex);

for i = 1: totalIndex
    currRow = floor((i-1)/blockCol) * blkSize + 1;
    currCol = (mod(i-1,blockCol)) * blkSize + 1;
    seperatedBlocks(:,:,i) = imgIn(currRow:currRow+blkSize-1, currCol:currCol+blkSize-1);
end

end

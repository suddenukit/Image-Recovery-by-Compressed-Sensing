function allPos = getAllPos(blkSize)
% Form a matrix which contains all the coordinates within the block size.
%
% INPUT:
%   blkSize: block size
%
% OUTPUT:
%   allPos: a blkSize * blkSize by 2 matrix which contains all the
%   coordinates

allPos = zeros(blkSize * blkSize, 2);
for i = 1: blkSize
    for j = 1: blkSize
        allPos((i-1) * blkSize + j, 1) = i;
        allPos((i-1) * blkSize + j, 2) = j;
    end
end

end
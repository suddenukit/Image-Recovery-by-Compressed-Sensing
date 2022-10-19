function alpha = OMP(A, B, lambda)
% Calculate an optimal alpha based on current lambda
%
% INPUT:
%   A: DCT Transform Matrix
%   B: samples
%   lambda: current regularization parameter
%
% OUTPUT:
%   alpha: DCT coefficients
colA = size(A, 2);
sampleSize = size(B, 1);
alpha = zeros(colA, 1);
nonZeroIndex = zeros(1, lambda);
F = B; % Error vector
normalizedA = A./repmat(sqrt(sum(A.^2,1)),size(A,1),1); % normalize A by each column

for p = 1:lambda
    maxInner = 0;
    maxInnerIndex = 1;
    for i = 1: colA
        innerProduct = abs(dot(normalizedA(:,i), F));
        if (innerProduct > maxInner)
            maxInner = innerProduct;
            maxInnerIndex = i;
        end
    end
    nonZeroIndex(p) = maxInnerIndex;
    partA = zeros(sampleSize, p);
    for i = 1: p
        partA(:, i) = A(:, nonZeroIndex(i));
    end
    tempAlpha = partA\B;
    F = B - partA * tempAlpha;
end

for i = 1: lambda
    alpha(nonZeroIndex(i)) = tempAlpha(i);
end

end

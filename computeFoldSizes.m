function [foldSizes] = computeFoldSizes(vecsPerCat, numFolds)

s_size=size(vecsPerCat);
numCats = s_size(1);
for i = 1 : numCats
 
    numVecs = vecsPerCat(i, 1);
  
    if (numVecs < numFolds)
        disp("ERROR! Each category must have at least 'numFolds' samples.");
        return;
    end
end

foldSizes = zeros(numCats, numFolds);

for i = 1 : numCats
  
    numVecs = vecsPerCat(i, 1);
  
    for fold = 1 : numFolds
        
        foldSize = ceil(numVecs / (numFolds - fold + 1));
        foldSizes(i, fold) = foldSize;
        numVecs = numVecs - foldSize;
    end
end
if (any(sum(foldSizes, 2) ~= vecsPerCat))
    disp("ERROR! The sum of fold sizes did not equal the number of category vectors.");
    return;
end
 
end
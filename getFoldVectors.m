function [X_train, y_train, X_val, y_val] = getFoldVectors(X_sorted, y_sorted, ...
                                                categories, vecsPerCat, ...
                                                foldSizes, roundNumber)

 
X_train = [];
y_train = [];
X_val = [];
y_val = [];

catStart = 1;

s_size=size(categories);
for i = 1 : s_size(1)
    
    catEnd = catStart + vecsPerCat(i) - 1;
    if (any(y_sorted(catStart : catEnd) ~= categories(i)))
        disp("Input vectors are not properly sorted!");
        return;
    end
    catStart = catEnd + 1;
end

ss_size=size(foldSizes);
numFolds = ss_size(2);
 
catStart = 1;
 
for catIndex = 1 : s_size(1)
 
    catFoldSizes = foldSizes(catIndex, :)';
    foldStart = catStart;
 
    for foldIndex = 1 : numFolds
        
        foldEnd = foldStart + catFoldSizes(foldIndex) - 1;
    
        foldVectors = X_sorted(foldStart : foldEnd, :);
        foldCats = y_sorted(foldStart : foldEnd, :);
         
        if (foldIndex == roundNumber)
            X_val = [X_val; foldVectors];
            y_val = [y_val; foldCats];
        else
            X_train = [X_train; foldVectors];
            y_train = [y_train; foldCats];
        end
        foldStart = foldEnd + 1;
    end
    catStart =catStart + vecsPerCat(catIndex);   
end
end
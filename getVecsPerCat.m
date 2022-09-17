function [vecsPerCat] = getVecsPerCat(X, y, categories)

numCats = length(categories);
vecsPerCat = zeros(numCats, 1);
 
for i = 1 : numCats

    cat = categories(i);
    vecsPerCat(i, 1) = sum(y == cat);    
end
 
end
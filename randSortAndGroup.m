function [X_sorted, y_sorted] = randSortAndGroup(X, y, categories)

s_size=size(X);
totalVecs = s_size(1);
randOrder = randperm(totalVecs)';

randVecs = X(randOrder, :);
randCats = y(randOrder, :);
 
X_sorted = [];
y_sorted = [];
 
ss_size=size(categories);
for i = 1 : ss_size(1)
    
    cat = categories(i);
    catVecs = randVecs((randCats == cat), :);
    catCats = randCats((randCats == cat), :);
    
    X_sorted = [X_sorted; catVecs];
    y_sorted = [y_sorted; catCats];
end
 
end
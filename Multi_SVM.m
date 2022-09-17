function prediction=Multi_SVM(x_train,x_test,label)

a=size(x_test);

pairwise = nchoosek(1:4,2);
svmModel = cell(size(pairwise,1),1);            
predTest = zeros(a(1),numel(svmModel));
% numel(svmModel)
for i=1:numel(svmModel)
    
    L1=label==pairwise(i,1); 
    L2=label==pairwise(i,2); 
    
    x_train1=x_train(L1,:); 
    x_train2=x_train(L2,:); 
    
    x_train_new=cat(1, x_train1,x_train2);
    
    s1=sum(L1);
    s2=sum(L2);
    siz=s1+s2;
    label_new=zeros(siz,1);
     
    label_new(1:s1,1)=1*pairwise(i,1);
    label_new((s1+1):siz,1)=1*pairwise(i,2);
    
    
    svmModel{i}= fitcsvm(x_train_new,label_new,'Standardize',true,'KernelFunction','RBF',...
     'KernelScale','auto');
    predTest(:,i) = predict(svmModel{i},x_test);
    
    
end
prediction = mode(predTest,2); 

end
function J=J_value3(f)

a=size(f);

J_init=zeros(6,a(2));

perm=[1 2;1 3;2 3];

for j=1:3

    for i=1:a(2)
        vec1=f((perm(j,1)-1)*20+1:perm(j,1)*20,i);
        vec2=f((perm(j,2)-1)*20+1:perm(j,2)*20,i);
        mu1=mean(vec1);
        mu2=mean(vec2);
        mu0=(mu1+mu2)/2;
        sigma1=var(vec1);
        sigma2=var(vec2);
        J_init(j,i)=((mu1-mu0)^2+(mu2-mu0)^2)/(sigma1+sigma2);
    end

end

J=J_init;
end
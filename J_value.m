function J=J_value(d1,d2)

mu1=mean(d1,1);
mu2=mean(d2,1);

sigma1=var(d1,1);
sigma2=var(d2,1);

mu0=(mu1+mu2)/2;

J=(norm(mu0-mu1).^2+norm(mu0-mu2).^2)/(norm(sigma1).^2+norm(sigma2).^2);

end
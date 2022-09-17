function y=Down_Sample(x,Fs1,Fs2)

p=Fs1/Fs2;
a=length(x);
k=ceil(a/p);

y=zeros(1,k);

for i=1:k
    y(1,i)=x(1,(i-1)*p+1);
end

end
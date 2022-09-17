function h = BPF(L,lowF,higF,FS)
    beta = 3;
    h = fir1(L-1,[2*lowF/FS,2*higF/FS], kaiser(L,beta));
    h = h(:);
    
end



function y = FilterDFT(x,h)
    X_FFT = fft([x; zeros((length(h)-1),size(x,2))],[],1);
    H_FFT = repmat(fft([h; zeros(size(x,1)-1,1)]),1,size(x,2));
    y     = ifft(X_FFT.*H_FFT,[],1);
    y     = y(floor(((length(h)+1)/2))+(1:size(x,1)),:);
end
function f=modefreq(x)


fft_data=fft(x);

Fs=120;

L =length(fft_data);

P2 = abs(fft_data/L);

P1 = P2(1:L/2+1);

P1(2:end-1) = 2*P1(2:end-1);

maximum=max(P1);

t=P1==maximum;
% bin frequency = num_bin *sample_rate/length
bin_frequency = Fs*(1:(L/2))/L; 

f=bin_frequency(t);
end
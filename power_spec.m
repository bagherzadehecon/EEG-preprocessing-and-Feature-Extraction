function []=power_spec(x,fs)

[pxx1,w1] = periodogram(x);
plot((w1/pi)*fs/2,pxx1)
xlabel('frequency')


end
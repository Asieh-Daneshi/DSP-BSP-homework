L=32;
% L=64;
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:32;
%#######################################################################
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
psd(x)
%#######################################################################
% w=blackman(L);
% y=conv(x,w);
% psd(y)
% %#######################################################################
% w = hamming(L);
% y=conv(x,w);
% psd(y)
% %#######################################################################
% w = hann(L);
% y=conv(x,w);
% psd(y)
% %#######################################################################
% w = bartlett(L);
% y=conv(x,w);
% psd(y)
% %#######################################################################
% w = rectwin(L);
% y=conv(x,w);
% psd(y)
% %#######################################################################
% triang(L);
% y=conv(x,w);
% psd(y)
% %#######################################################################
% Hs=spectrum.welch;
% psd(Hs,x)
% %#######################################################################
% Hs=spectrum.periodogram;	
% psd(Hs,x)
%#######################################################################
grid off
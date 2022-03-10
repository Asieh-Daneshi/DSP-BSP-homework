function [an,e] = mvdr()

clc
clear all

f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:64;
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
x=x';               % x=num2cell(x);
m=59;
R = xcorr(x,m);

Rm = toeplitz(R(1+m+(0:m)));
iRm = inv(Rm);

N = 2^10;
w = (0:(N-1))/N;
for k = 1:length(w)
    V(:,k) = exp(1i*w(k)*pi*(0:m))';
end
for k = 1:length(w)
    P(k) = 1./(V(:,k)'*iRm*V(:,k));
end

R2 = real(fft([P fliplr(P(2:end))]));
Rm2 = toeplitz(R2(1+(0:m)));
iRm2 = inv(Rm2);
an = [1 zeros(1,m)]*iRm2;
an = an/an(1);
e = an*Rm2*an';
% plot(an)
freqz(1,an)
title('MVDR'); 
function []=bsp1_order()
clear all
close all
clc
%#######################################################################
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:64;
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
%#######################################################################
for n=1:64
    mb=ar(x,n);
    a=aic(mb);
    y(n)=a;
end
plot(y)
title('Order Estimation');  
xlabel('Oredr Of The AR Model "M"');  
ylabel('AIC(M)'); 
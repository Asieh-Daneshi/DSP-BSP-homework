function[]=e3()
w=[0:1:500]*pi/500;
X=2.5*exp(j*w)./(exp(j*w)+0.9*exp(0.1*j*pi)*ones(1,501))+2.5*exp(j*w)./(exp(j*w)+0.9*exp(-0.1*j*pi)*ones(1,501));
magX=abs(X);angX=angle(X);
subplot(2,1,1);plot(w/pi,magX);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(w/pi,angX);grid
xlabel('frequency in pi units');title('angle part')
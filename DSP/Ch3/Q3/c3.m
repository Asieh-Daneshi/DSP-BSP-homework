function[]=c3()
w=[0:1:50]*pi/50;
X=exp(2*j*w)./(exp(j*w)-ones(1,51)).^2-exp(j*w)./(exp(j*w)-ones(1,51));
magX=abs(X);angX=angle(X);
subplot(2,1,1);plot(w/pi,magX);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(w/pi,angX);grid
xlabel('frequency in pi units');title('angle part')
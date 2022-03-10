function[]=a2()
n=0:20;x=2*(0.8).^n;
k=-100:100;w=(pi/100)*k;
X=x*(exp(-j*pi/100)).^(n'*k);
magX=abs(X);angX=angle(X);
subplot(2,1,1);plot(k/500,magX);grid
xlabel('frequency in pi units');title('magnitude part')
subplot(2,1,2);plot(k/500,angX);grid
xlabel('frequency in pi units');title('angle part')